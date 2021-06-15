using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MostriVsEroi.Services;
using MostriVsEroi.Core;

namespace MostriVsEroi.View
{
    class EroeView
    {
        public static Eroe ScegliEroe(Utente utente)
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
                        Console.WriteLine($"Premi {count} per scegliere l'eroe {eroe.NomeEroe}, di tipo {eroe.TipoEroe}" +
                            $" con arma {eroe.Arma.NomeArma} che ha {eroe.Arma.PuntiDanno} punti danno, di livello {eroe.Livello} e vita {eroe.PuntiVita}");
                        count++;
                    }

                    //Conversione dentro quel metodo
                    //stringa scelta = Console.ReadLine()
                    //EroeServices.VerificaSceltaCorretta(scelta, eroi.Count)
                    //While(EroiServices.VerificaSceltaCorretta()

                    conversione = int.TryParse(Console.ReadLine(), out eroeScelto);
                } while (!conversione || eroeScelto < 1 || eroeScelto > eroi.Count);

                return eroi[--eroeScelto];
            }
            else
            {
                Console.WriteLine("Nessun eroe in lista");
                return null; //return new Eroe
            }

        }
    }
}
