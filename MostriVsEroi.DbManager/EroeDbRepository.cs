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
