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
           
            return mostro;
        }
    }
}
