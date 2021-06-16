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
            if (eroe.NomeEroe != null)
            {
                Mostro monster = MostroView.ScegliMostro(utente);

                if (monster.LivelloMostro > eroe.Livello)
                {
                    MostroView.ScegliMostro(utente);
                }
                else
                {
                    Console.WriteLine($"{eroe.NomeEroe} vs {monster.NomeMostro}");
                }

            }
        }
    }
}