using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MostriVsEroi.DbManager
{
    public class CategoriaDbRepository
    {
        public List<string> FetchCategorie()
        {
            DbConnectionRepository.Connection(out SqlConnection connection, out SqlCommand cmd);
            List<string> categorie = new List<string>();

            return categorie;
        }
    }
}
