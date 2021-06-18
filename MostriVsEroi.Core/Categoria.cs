using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MostriVsEroi.Core
{
    public class Categoria
    {
        public string Personaggio { get; set; } //se eroe o mostro
        public string Tipo { get; set; }//tipo di eroe/tipo di mostro
        public Categoria()
        {
                
        }
        public Categoria(string personaggio,string tipo)
        {
            Personaggio = personaggio;
            Tipo = tipo;
        }
    }
}
