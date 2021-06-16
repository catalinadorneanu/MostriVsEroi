using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MostriVsEroi.Core;

namespace MostriVsEroi.MockRepository
{
   public class ArmaMockRepository
    {
        public List<Arma> FetchArmiMago()
        {
            List<Arma> armi = new List<Arma>();
            armi.Add(new Arma("Arco e frecce",8));
            armi.Add(new Arma("Bacchetta",5));
            armi.Add(new Arma("Bastone Magico",10));
            armi.Add(new Arma("Onda d'urto",15));
            armi.Add(new Arma("Pugnale",5));
            return armi;
        }
        public List<Arma> FetchArmiGuerriero()
        {
            List<Arma> armi = new List<Arma>();
            armi.Add(new Arma("Alabarda", 15));
            armi.Add(new Arma("Ascia", 8));
            armi.Add(new Arma("Mazza", 5));
            armi.Add(new Arma("Spada", 10));
            armi.Add(new Arma("Spadone", 15));
            return armi;
        }
    }
}
