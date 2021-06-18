using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MostriVsEroi.Core;

namespace MostriVsEroi.DbManager
{
    public class MostroDbRepository
    {
        public List<Mostro> FetchMostri(Utente utente)
        {
            DbConnectionRepository.Connection(out SqlConnection connection, out SqlCommand cmd);
            List<Mostro> mostro = new List<Mostro>();
            cmd.CommandText = "SELECT * FROM dbo.TipiMostri";
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {

                var nome = (string)reader[0];
                var personaggio = (string)reader[1];
                var nomeArma = (string)reader[2];
                var puntiDanno = (int)reader[3];
                var livello = (int)reader[4];
                var puntiVita = (int)reader[5];
                
                // var tipo =(string) reader[5];
               
              

                Mostro m = new Mostro(nome, personaggio, new Arma(nomeArma, puntiDanno), livello, puntiVita);
                mostro.Add(m);
            }
            connection.Close();
            
            return mostro;
        }
    }
}
