using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MostriVsEroi.Core;

namespace MostriVsEroi.MockRepository
{
    public class EroeMockRepository
    {
        public List<Eroe> FetchEroi(Utente utente) 
        {
            List<Eroe> eroi = new List<Eroe>();
            eroi.Add(new Eroe("Bugbear", "Guerriero", new Arma("Ascia",8),1,20,0));
            eroi.Add(new Eroe("Aasimar", "Mago", new Arma("Bastone Magico",10),2,40,0));
            return eroi;
        }
    }
}
