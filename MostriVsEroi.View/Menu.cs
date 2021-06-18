using System;
using MostriVsEroi.Core;

namespace MostriVsEroi.View
{
    public class Menu
    {
        public static void MainMenu()
        {
            bool vuoiContinuare = true;
            do
            {
                Console.WriteLine("Bentornato");
                Console.WriteLine();
                Console.WriteLine("Cosa vuoi fare?");

                Console.WriteLine("Premi 1 per accedere");
                Console.WriteLine("Premi 2 per registrarti");
                Console.WriteLine("Premi 0 per uscire");

                string scelta = Console.ReadLine();

                switch (scelta)
                {
                    case "1":
                        AccediView.Accedi();
                        break;
                    case "2":
                        RegistraView.Registrati();
                        break;
                    case "0":
                        Console.WriteLine("Alla prossima");
                        vuoiContinuare = false;
                        break;
                    default:
                        Console.WriteLine("Scelta sbagliata, riprova");
                        break;
                }
            } while (vuoiContinuare);
        }

        internal static void MenuNonAdmin(Utente utente)
        {
            bool vuoiContinuare = true;
            do
            {
                Console.WriteLine($"Bentornato {utente.Username}");
                Console.WriteLine();
                Console.WriteLine("Cosa vuoi fare?");

                Console.WriteLine("Premi 1 per giocare");
                Console.WriteLine("Premi 2 per creare un nuovo eroe");
                Console.WriteLine("Premi 3 per eliminare un eroe");
                Console.WriteLine("Premi 0 per tornare al menu principale");

                string scelta = Console.ReadLine();

                switch (scelta)
                {
                    case "1":
                        GiocaView.Gioca(utente);
                        break;
                    case "2":
                        //CreaEroeView.CreaEroe(utente);
                        break;
                    case "3":
                        EliminaEroeView.EliminaEroe(utente);
                        break;
                    case "0":
                        MainMenu();
                        break;
                    default:
                        Console.WriteLine("Scelta sbagliata, riprova");
                        break;
                }
            } while (vuoiContinuare);
        }
    }
}
