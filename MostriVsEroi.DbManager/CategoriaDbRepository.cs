using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MostriVsEroi.Core;

namespace MostriVsEroi.DbManager
{
    public class CategoriaDbRepository
    {
        public List<Categoria> FetchCategorieEroi()
        {
            DbConnectionRepository.Connection(out SqlConnection connection, out SqlCommand cmd);
            List<Categoria> categorie = new List<Categoria>();
            cmd.CommandText = "SELECT Tipo FROM dbo.Categorie WHERE Personaggio='Eroe';";
            SqlDataReader reader = cmd.ExecuteReader();
            //while (reader.Read())
            //{
            //    var tipo = (string)reader[1];
            //    var personaggio= (string)reader[2];

            //    Categoria c = new Categoria(tipo,personaggio);
            //    categorie.Add(c);
                
            //}
            connection.Close();
            return categorie;
        }
    }
}
