using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MostriVsEroi.DbManager
{
    public class LivelloDbRepository
    {
        public List<int> FetchLivelli()
        {
            DbConnectionRepository.Connection(out SqlConnection connection, out SqlCommand cmd);
            List<int> livelli = new List<int>();

            return livelli;
        }
    }
}
