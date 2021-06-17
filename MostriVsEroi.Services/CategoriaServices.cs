using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MostriVsEroi.DbManager;

namespace MostriVsEroi.Services
{
    class CategoriaServices
    {
      
        static CategoriaDbRepository cmr = new CategoriaDbRepository();
        public static List<string> GetCategorie()
        {
            return cmr.FetchCategorie();

        }
    }
}
