using System;
using MostriVsEroi.MockRepository;
using MostriVsEroi.Core;

namespace MostriVsEroi.Services
{
    public static class UtenteServices
    {

        
            static UtenteMockRepository umr = new UtenteMockRepository();
            //static UtenteDbRepository umr = new UtenteDbRepository();
            public static Utente VerifyAuthentication(Utente utente)
            {
                return umr.GetUser(utente);
            }

        public static void AggiungiUtente(Utente utente)
        {
            umr.AddUtente(utente);
        }
    }
}