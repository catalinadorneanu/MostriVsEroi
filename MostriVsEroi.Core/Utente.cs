using System;
using System.Collections.Generic;

namespace MostriVsEroi.Core
{
    public class Utente
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public bool IsAdmin { get; set; }
        public bool IsAutenticated { get; set; }

        public Utente(string username, string password)
        {
            Username = username;
            Password = password;
            IsAdmin = false;
            IsAutenticated = false;

        }

    }
}
