using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MostriVsEroi.Services;
using MostriVsEroi.Core;

namespace MostriVsEroi.View
{
    public class MostroView
    {
        public static Mostro ScegliMostro(Utente utente)
        {
            
            List<Mostro> mostri = MostroServices.GetMostri(utente);
            int scelta = 0;
            if (mostri.Count > 0)
            {
                Random rnd = new Random();
                scelta = rnd.Next(0, mostri.Count - 1);

                return mostri[scelta];
            }
            else
            {
                return null;
            }

        }
    }

}
