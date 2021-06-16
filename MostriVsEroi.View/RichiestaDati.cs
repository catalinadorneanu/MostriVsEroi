using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MostriVsEroi.Core;
using MostriVsEroi.SchermataServices;

namespace MostriVsEroi.View
{
    class RichiestaDati
    {
        internal static Utente InserisciUsernamePassword()
        {
            Console.WriteLine("Inserisci il tuo username");
            string username = Console.ReadLine();

            Console.WriteLine("Inserisci la tua password");
            string password = Console.ReadLine();

            //fare controlli ovviamente
            return UtenteSchermataServices.GetUtente(username, password);
        }
        internal static Utente IserisciDatiRegistrazione()
        {
            Console.WriteLine("Inserisci il tuo username");
            string username = Console.ReadLine();

            Console.WriteLine("Inserisci la tua password");
            string password = Console.ReadLine();

            //fare controlli ovviamente
            return UtenteSchermataServices.GetUtente(username, password);
        }
    }
}
