using System;
using MostriVsEroi.Core;

namespace MostriVsEroi.SchermataServices
{
    public class UtenteSchermataServices
    {
        public static Utente GetUtente(string username, string password)
        {
            return new Utente(username,password);
        }
    }
}
