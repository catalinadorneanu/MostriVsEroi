using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MostriVsEroi.Services;
using MostriVsEroi.Core;

namespace MostriVsEroi.View
{
    static class AccediView
    {
        public static void Accedi()
        {
            Utente utente = RichiestaDati.InserisciUsernamePassword();
            utente = UtenteServices.VerifyAuthentication(utente);
            if(utente.IsAutenticated && utente.IsAdmin)
            {
                //menu admin
            }else if (utente.IsAutenticated && !utente.IsAdmin)
            {
               Menu.MenuNonAdmin(utente);
            }
            else
            {
                Console.WriteLine("Devi prima registrarti");
            }
        }


    }
}
