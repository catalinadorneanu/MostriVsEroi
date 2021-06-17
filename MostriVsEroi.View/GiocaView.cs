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
            //giocare ancora - done

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
                //vitaMostro = vitaMostro - armaEroe
                mostro.PuntiVita = mostro.PuntiVita - eroe.Arma.PuntiDanno;
              
                //se vita mostro > 0
                if (mostro.PuntiVita > 0)
                {
                    //vitaEroe = vitaEroe - armaMostro
                    eroe.PuntiVita = eroe.PuntiVita - mostro.Arma.PuntiDanno;
                }
                //se vita eroe < 0
                if (eroe.PuntiVita < 0)
                {
                    //hai perso
                    Console.WriteLine("Hai perso");
                }
                else
                {
                    Console.WriteLine("Hai vinto");
                }
            }
            if (scelta.ToUpper() == "F")
            {

                Menu.MenuNonAdmin(utente);
            }

            Console.WriteLine("Vuoi giocare ancora? S/N");
            string choice = Console.ReadLine();
            if (choice.ToUpper() == "S")
            {
                Gioca(utente);
            }
            if (choice.ToUpper() == "N")
            {
                Menu.MenuNonAdmin(utente);
            }
        }

        //private static void MostroAttaccaEroe(Mostro mostro, Eroe eroe)
        //{
        //    eroe.PuntiVita = eroe.PuntiVita - mostro.Arma.PuntiDanno;
        //}

        //private static void EroeAttaccaMostro(Mostro mostro, Eroe eroe)
        //{

        //    mostro.PuntiVita = mostro.PuntiVita - eroe.Arma.PuntiDanno;
        //}
    }
}