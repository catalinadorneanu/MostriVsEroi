using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MostriVsEroi.MockRepository;
using MostriVsEroi.Core;
using MostriVsEroi.DbManager;

namespace MostriVsEroi.Services
{
    public class MostroServices
    {

        static MostroMockRepository mmr = new MostroMockRepository();
        //static MostroDbRepository mmr = new MostroDbRepository();
        public static List<Mostro> GetMostri(Utente utente)
            {
            return mmr.FetchMostri(utente);
            }
        
    }
}
