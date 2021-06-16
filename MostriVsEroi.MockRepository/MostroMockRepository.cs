using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MostriVsEroi.Core;


namespace MostriVsEroi.MockRepository
{
   public class MostroMockRepository
    {
        public List<Mostro> FetchMostri(Utente utente)
        {
            List<Mostro> mostro = new List<Mostro>();
            mostro.Add(new Mostro("Aboleth","Cultista", new Arma("Imprecazione", 5), 1,20));
            mostro.Add(new Mostro("Belva distorcente","Orco", new Arma("Mazza chiodata", 10),2,40));
            mostro.Add(new Mostro(" Chimera","Signore del male", new Arma("Divinazione", 15),2,40));
            return mostro;
        }
    }
}
