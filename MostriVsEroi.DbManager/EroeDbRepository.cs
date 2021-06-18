using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MostriVsEroi.Core;

namespace MostriVsEroi.DbManager
{
    public class EroeDbRepository
    {
        public List<Eroe> FetchEroi(Utente utente)
        {
            DbConnectionRepository.Connection(out SqlConnection connection, out SqlCommand cmd);
            List<Eroe> eroi = new List<Eroe>();
            cmd.CommandText = "SELECT * FROM dbo.UtenteConEroi WHERE Username = @Username;";

            cmd.Parameters.AddWithValue("@Username", utente.Username);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                
                var nome = (string)reader[1];
                var nomeArma =(string) reader[2];
                var puntiDanno = (int)reader[3];
                
               
                var puntiAccumulati = (int)reader[4];
               // var tipo =(string) reader[5];
                var personaggio = (string)reader[6];
                var livello = (int)reader[7];
                var puntiVita = (int)reader[8];

                Eroe e = new Eroe (nome,personaggio,new Arma(nomeArma, puntiDanno),livello, puntiVita,puntiAccumulati);
                eroi.Add(e);
            }
            connection.Close();
            return eroi;

        }
        public void AggiungiEroe(Utente utente, Eroe eroe)
        {
            DbConnectionRepository.Connection(out SqlConnection connection, out SqlCommand cmd);
        }

        public void CancellaEroe(Utente utente, Eroe eroeEliminato)
        {
            DbConnectionRepository.Connection(out SqlConnection connection, out SqlCommand cmd);
        }
    }
}
