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
          
            return armi;
        }
    }
}
