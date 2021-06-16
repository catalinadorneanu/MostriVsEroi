using System;
using System.Collections.Generic;
using MostriVsEroi.Services;
using MostriVsEroi.Core;

namespace MostriVsEroi.View
{
    internal class GiocaView
    {
        internal static void Gioca(Utente utente)
        {
            //scelta eroe - done
            //scelta mostro - done
            //partita - done
            //calcolo livello e punteggio - todo
            //giocare ancora - todo

            Eroe eroe = EroeView.ScegliEroe(utente);
            List<Mostro> mostri = MostroServices.GetMostri(utente);
            Mostro mostro = MostroView.ScegliMostro(utente);

            if (mostro.LivelloMostro <= eroe.Livello)
            {
                foreach (Mostro m in mostri)
                {
                    MostroView.ScegliMostro(utente);
                }
            }

            Console.WriteLine($"{eroe.NomeEroe} vs {mostro.NomeMostro}");
            Console.WriteLine("Accetti la sfida?");
            Console.WriteLine("Premi A per Attaccare ed F per Fuggire");
            string scelta = Console.ReadLine();
            if (scelta.ToUpper() == "A")
            {
                while (eroe.PuntiVita > 0 && mostro.PuntiVita > 0)
                {
                    EroeAttaccaMostro(mostro, eroe);
                    MostroAttaccaEroe(mostro, eroe);
                }
                if (eroe.PuntiVita <=0)
                {
                    Console.WriteLine("Hai perso");
                }
                if (mostro.PuntiVita <= 0)
                {
                    Console.WriteLine("Hai vinto");
                }
            }
            if (scelta.ToUpper() == "F")
            {
               
                Menu.MenuNonAdmin(utente);
            }

        }

        private static void MostroAttaccaEroe(Mostro mostro, Eroe eroe)
        {
            eroe.PuntiVita = eroe.PuntiVita - mostro.Arma.PuntiDanno;
        }

        private static void EroeAttaccaMostro(Mostro mostro, Eroe eroe)
        {
            
            mostro.PuntiVita = mostro.PuntiVita - eroe.Arma.PuntiDanno;
        }
    }
}