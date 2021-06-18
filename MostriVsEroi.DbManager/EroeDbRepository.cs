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
                var idEroe = (int)reader[0];
                var nome = (string)reader[1];
                var nomeArma =(string) reader[2];
                var puntiDanno = (int)reader[3];
                var puntiAccumulati = (int)reader[4];
                var tipo =(string) reader[5];
                var personaggio = (string)reader[6];
                var livello = (int)reader[7];
                var puntiVita = (int)reader[8];

                Eroe e = new Eroe (idEroe ,nome,new Categoria (personaggio,tipo),new Arma(nomeArma, puntiDanno),livello, puntiVita,puntiAccumulati);
                eroi.Add(e);
            }
            connection.Close();
            return eroi;

        }
        public void AggiungiEroe(Utente utente, Eroe e)
        {
            DbConnectionRepository.Connection(out SqlConnection connection, out SqlCommand cmd);
            int idUtente = FetchIdUtente(utente);
            int idCategoria = FetchIdCategoria(e);
            int idArma = FetchIdArma(e);
            int idLivello = FetchIdLivello(e);

            cmd.CommandText = "insert into dbo.Eroi (IdEroe,Nome,IdCategoria,IdArma,IdLivello,IdUtente,PuntiAccumulati) values (@IdEroe,@Nome,@IdCategoria,@IdArma,@IdLivello,@IdUtente,@PuntiAccumulati)";
            cmd.Parameters.AddWithValue("@IdEroe", e.IdEroe);
            cmd.Parameters.AddWithValue("@Nome", e.NomeEroe);
            cmd.Parameters.AddWithValue("@IdCategoria", idCategoria);
            cmd.Parameters.AddWithValue("@IdArma", idArma);
            cmd.Parameters.AddWithValue("@IdLivello", idLivello);
            cmd.Parameters.AddWithValue("@IdUtente", idUtente);
            cmd.Parameters.AddWithValue("@PuntiAccumulati", 0);

            cmd.ExecuteNonQuery();

            connection.Close();
        }
        private int FetchIdCategoria(Eroe eroe)
        {
            DbConnectionRepository.Connection(out SqlConnection connection, out SqlCommand cmd);
            cmd.CommandText = "select IdCategoria from dbo.Categorie WHERE Tipo = @Tipo AND Personaggio = @Personaggio;";
            cmd.Parameters.AddWithValue("@Tipo", eroe.Categoria.Tipo);
            cmd.Parameters.AddWithValue("@Personaggio", eroe.Categoria.Personaggio);
            SqlDataReader reader = cmd.ExecuteReader();
            int idCategoria = 0;
            while (reader.Read())
            {
                var id = (int)reader[0];
                idCategoria = id;
            }
            connection.Close();
            return idCategoria;
        }
        private int FetchIdUtente(Utente utente)
        {
            DbConnectionRepository.Connection(out SqlConnection connection, out SqlCommand cmd);
            cmd.CommandText = "select IdUtente from dbo.Utenti WHERE Username = @Username;";
            cmd.Parameters.AddWithValue("@Username", utente.Username);
            SqlDataReader reader = cmd.ExecuteReader();
            int idUtente = 0;
            while (reader.Read())
            {
                var id = (int)reader[0];
                idUtente = id;
            }
            connection.Close();
            return idUtente;
        }
        private int FetchIdArma(Eroe eroe)
        {
            DbConnectionRepository.Connection(out SqlConnection connection, out SqlCommand cmd);
            cmd.CommandText = "select IdArma from dbo.Armi WHERE NomeArma = @NomeArma;";
            cmd.Parameters.AddWithValue("@NomeArma", eroe.Arma.NomeArma);
            SqlDataReader reader = cmd.ExecuteReader();
            int idArma = 0;
            while (reader.Read())
            {
                var id = (int)reader[0];
                idArma = id;
            }
            connection.Close();
            return idArma;
        }
        private int FetchIdLivello(Eroe eroe)
        {
            DbConnectionRepository.Connection(out SqlConnection connection, out SqlCommand cmd);

            cmd.CommandText = "SELECT IdLivello FROM dbo.Livelli WHERE Livello=@Livello AND PuntiVita=@PuntiVita ";
            cmd.Parameters.AddWithValue("@Livello", eroe.Livello);
            cmd.Parameters.AddWithValue("@PuntiVita", eroe.PuntiVita);
            SqlDataReader reader = cmd.ExecuteReader();
            int idLivello = 0;
            while (reader.Read())
            {
                var id = (int)reader[0];
                idLivello = id;
            }
            connection.Close();
            return idLivello;
        }
        public void CancellaEroe(Utente utente, Eroe eroeEliminato)
        {
            DbConnectionRepository.Connection(out SqlConnection connection, out SqlCommand cmd);
            int idUtente = FetchIdUtente(utente);
            cmd.CommandText = "DELETE FROM dbo.Eroi WHERE Nome = @Nome AND IdUtente = @IdUtente; ";
            cmd.Parameters.AddWithValue("@Nome", eroeEliminato.NomeEroe);
            cmd.Parameters.AddWithValue("@IdUtente", idUtente);
            cmd.ExecuteNonQuery();
            connection.Close();
        }
    }
}
