using System;
using MostriVsEroi.Core;
using MostriVsEroi.Services;

namespace MostriVsEroi.View
{
    internal class RegistraView
    {
        internal static void Registrati()
        {
            Utente utente = RichiestaDati.IserisciDatiRegistrazione();
            utente = UtenteServices.VerifyAuthentication(utente);
            UtenteServices.AggiungiUtente(utente);
            if (utente.IsAutenticated && utente.IsAdmin)
            {
                //menu admin
            }
            else if (utente.IsAutenticated && !utente.IsAdmin)
            {
                Menu.MenuNonAdmin(utente);
            }
            else
            {
                Console.WriteLine("Riprova");
            }
        }
    }
}