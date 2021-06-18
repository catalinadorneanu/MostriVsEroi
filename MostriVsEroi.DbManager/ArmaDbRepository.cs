using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MostriVsEroi.Core;

namespace MostriVsEroi.DbManager
{
    public class ArmaDbRepository
    {
        public List<Arma> FetchArmi()
        {
            DbConnectionRepository.Connection(out SqlConnection connection, out SqlCommand cmd);
            List<Arma> armi = new List<Arma>();
            cmd.CommandText = "SELECT * FROM dbo.Armi;";
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                var nomeArma = (string)reader[1];
                var puntiDanno = (int)reader[2];

                Arma a = new Arma(nomeArma, puntiDanno);
                armi.Add(a);

            }
            connection.Close();
            return armi;
        }
    }
}
