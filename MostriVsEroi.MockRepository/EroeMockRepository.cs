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
        static List<Eroe> eroi = new List<Eroe>();
        public List<Eroe> FetchEroi(Utente utente) 
        {
            
            //eroi.Add(new Eroe("Bugbear", "Guerriero", new Arma("Ascia",8)));
            //eroi.Add(new Eroe("Aasimar", "Mago", new Arma("Bastone Magico",10)));
            return eroi;
        }
        public void AggiungiEroe(Utente utente, Eroe eroe)
        {
            eroi.Add(eroe);
        }

        public void CancellaEroe(Utente utente, Eroe eroeEliminato)
        {
            eroi.Remove(eroeEliminato);
        }
    }
}
