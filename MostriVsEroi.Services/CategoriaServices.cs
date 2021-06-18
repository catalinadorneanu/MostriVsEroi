using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MostriVsEroi.Core;
using MostriVsEroi.DbManager;

namespace MostriVsEroi.Services
{
   public class CategoriaServices
    {
      
        static CategoriaDbRepository cmr = new CategoriaDbRepository();
        public static List<Categoria> GetCategorieEroi()
        {
            return cmr.FetchCategorieEroi();

        }

    }
}
