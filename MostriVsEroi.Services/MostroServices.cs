using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MostriVsEroi.MockRepository;
using MostriVsEroi.Core;

namespace MostriVsEroi.Services
{
    public class MostroServices
    {
        
            static MostroMockRepository mmr = new MostroMockRepository();
            public static List<Mostro> GetMostri(Utente utente)
            {
            return mmr.FetchMostri(utente);
            }
        
    }
}
