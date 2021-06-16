﻿using System;
using System.Collections.Generic;
using MostriVsEroi.Core;
using MostriVsEroi.Services;

namespace MostriVsEroi.View
{
    internal class EliminaEroeView
    {
        internal static void EliminaEroe(Utente utente)
        {
            Console.WriteLine("Scegli eroe");
            List<Eroe> eroi = EroeServices.GetEroi(utente);
            if (eroi.Count > 0)
            {

                int count = 1;
                bool conversione = false;
                int eroeScelto;
                do
                {
                    foreach (Eroe eroe in eroi)
                    {
                        Console.WriteLine($"Premi {count++} per scegliere l'eroe {eroe.NomeEroe}, di tipo {eroe.TipoEroe}" +
                            $" con arma {eroe.Arma.NomeArma} che ha {eroe.Arma.PuntiDanno} punti danno, di livello {eroe.Livello} e vita {eroe.PuntiVita}");

                    }

                    conversione = int.TryParse(Console.ReadLine(), out eroeScelto);
                } while (!conversione || eroeScelto < 1 || eroeScelto > eroi.Count);

                Eroe eroeEliminato = eroi[--eroeScelto];
                EroeServices.DeleteEroe(utente, eroeEliminato);
                Console.WriteLine($"{eroeEliminato.NomeEroe} eliminato con successo");
            }
           
        }
    }
}