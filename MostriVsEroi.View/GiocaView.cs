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
            //scelta eroe
            //scelta mostro
            //partita
            //calcolo livello e punteggio
            //giocare ancora

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
               
                    int puntiEroe = mostro.PuntiVita - eroe.Arma.PuntiDanno;
                
            }
            if (scelta.ToUpper() == "F")
            {

            }

        }

        
    }
}