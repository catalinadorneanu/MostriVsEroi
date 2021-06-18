using System;
using System.Data.SqlClient;
using MostriVsEroi.Core;

namespace MostriVsEroi.DbManager
{
    public class UtenteDbRepository : IUtenteRepository

    {
        public void AddUtente(Utente utente)
        {
            DbConnectionRepository.Connection(out SqlConnection connection, out SqlCommand cmd);
            cmd.CommandText = "insert into dbo.Utenti values (@Username, @Password @IsAdmin)";
            cmd.Parameters.AddWithValue("@Username", utente.Username);
            cmd.Parameters.AddWithValue("@Password", utente.Password);
            cmd.Parameters.AddWithValue("@IsAdmin", false);
            cmd.ExecuteNonQuery();
            connection.Close();
        }

        public Utente GetUser(Utente utente)
        {
            DbConnectionRepository.Connection(out SqlConnection connection, out SqlCommand cmd);
            cmd.CommandText = "SELECT * from dbo.Utenti WHERE Username = @Username AND Password = @Password;";
            cmd.Parameters.AddWithValue("@Username", utente.Username);
            cmd.Parameters.AddWithValue("@Password", utente.Password);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                utente.IsAutenticated = true;
            }
            else
            {
                utente.IsAutenticated = false;

            }
            connection.Close();
            return utente;
        }
    }
}
