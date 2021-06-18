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
    public class ArmaServices
    {
        //static ArmaMockRepository amr = new ArmaMockRepository();
        static ArmaDbRepository amr = new ArmaDbRepository();
        //public static List<Arma> GetArmiMago()
        //{
        //    return amr.FetchArmiMago();

        //}
        //public static List<Arma> GetArmiGuerriero()
        //{
        //    return amr.FetchArmiGuerriero();

        //}
        public static List<Arma> GetArmi()
        {

            return amr.FetchArmi();
        }
    }
}
