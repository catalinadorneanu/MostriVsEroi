using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MostriVsEroi.DbManager;

namespace MostriVsEroi.Services
{
    public class LivelloServices
    {
        static LivelloDbRepository lmr = new LivelloDbRepository();
        public static List<int> GetLivello()
        {
            return lmr.FetchLivelli();
        }
    }
}
