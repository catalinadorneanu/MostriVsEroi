using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MostriVsEroi.MockRepository;
using MostriVsEroi.Core;

namespace MostriVsEroi.Services
{
   public class ArmaServices
    {
        static ArmaMockRepository amr = new ArmaMockRepository();
        public static List<Arma> GetArmiMago()
        {
            return amr.FetchArmiMago();
               
        }
        public static List<Arma> GetArmiGuerriero()
        {
            return amr.FetchArmiGuerriero();
            
        }
    }
}
