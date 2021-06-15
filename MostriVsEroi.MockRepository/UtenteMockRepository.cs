using System;
using MostriVsEroi.Core;

namespace MostriVsEroi.MockRepository
{
    public class UtenteMockRepository: IUtenteRepository
    {
        public Utente GetUser(Utente utente)
        {
            utente.IsAutenticated = true;
            return utente;
        }
    }
}
