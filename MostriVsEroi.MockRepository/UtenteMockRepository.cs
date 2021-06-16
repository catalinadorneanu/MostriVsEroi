using System;
using System.Collections.Generic;
using MostriVsEroi.Core;

namespace MostriVsEroi.MockRepository
{
    public class UtenteMockRepository: IUtenteRepository
    {
        List<Utente> utenti = new List<Utente>();
        public Utente GetUser(Utente utente)
        {
            utente.IsAutenticated = true;
            return utente;
        }

        public void AddUtente(Utente utente)
        {
            utenti.Add(utente);
        }
    }
}
