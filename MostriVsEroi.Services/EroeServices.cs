using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MostriVsEroi.Core;
using MostriVsEroi.MockRepository;

namespace MostriVsEroi.Services
{
    public class EroeServices
    {
        static EroeMockRepository emr = new EroeMockRepository();
        public static List<Eroe> GetEroi(Utente utente)
        {
            return emr.FetchEroi(utente);
        }
        public static void AddEroe(Utente utente, Eroe eroe)
        {
            emr.AggiungiEroe(utente, eroe);
        }

        public static void DeleteEroe(Utente utente, Eroe eroeEliminato)
        {
            emr.CancellaEroe(utente, eroeEliminato);
        }
    }
}
