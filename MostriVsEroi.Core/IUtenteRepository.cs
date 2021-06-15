using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MostriVsEroi.Core
{
    public interface IUtenteRepository
    {
        public Utente GetUser(Utente utente);
        
    }
}
