using System;
using System.Collections.Generic;
using MostriVsEroi.Services;
using MostriVsEroi.Core;

namespace MostriVsEroi.View
{
    internal class CreaEroeView
    {
        static List<Arma> armiM = ArmaServices.GetArmiMago();
        static List<Arma> armiG = ArmaServices.GetArmiGuerriero();

        public static void CreaEroe(Utente utente)
        {
            Console.WriteLine("Crea un nuovo eroe");
            Console.WriteLine("Inserisci il nome desiderato:");
            string nome = Console.ReadLine();
            Console.WriteLine("Scegli se il tuo ero sarà un Mago o un Guerriero");
            string categoria = Console.ReadLine();
            if (categoria == "Mago")
            {

                Console.WriteLine("Scegli l'arma da mago desiderata");
                foreach (Arma arma in armiM)
                {
                    Console.WriteLine($"{arma.NomeArma} Punti danno: { arma.PuntiDanno}");
                }
                string tipoArma = Console.ReadLine();
                Console.WriteLine("Inserisci il punteggio corrispondente all'arma scelta:");
                int puntiArma = int.Parse(Console.ReadLine());
                Arma arma1 = new Arma(tipoArma, puntiArma);
                Eroe newEroe = new Eroe(nome, categoria, arma1);
                EroeServices.AddEroe(utente,newEroe);
                Console.WriteLine($"Contgratulazioni, il tuo nuovo eroe è un {newEroe.TipoEroe} di nome: {newEroe.NomeEroe} e combatterà con: {newEroe.Arma.NomeArma}");

            }

            if (categoria == "Guerriero")
            {
                Console.WriteLine("Scegli l'arma da guerriero desiderata");
                foreach (Arma arma in armiG)
                {
                    Console.WriteLine($"{arma.NomeArma} Punti danno: { arma.PuntiDanno}");
                }
                string tipoArma = Console.ReadLine();
                Console.WriteLine("Inserisci il punteggio corrispondente all'arma scelta:");
                int puntiArma = int.Parse(Console.ReadLine());
                Arma arma2 = new Arma(tipoArma, puntiArma);
                Eroe newEroe = new Eroe(nome, categoria, arma2);
                EroeServices.AddEroe(utente, newEroe);
                Console.WriteLine($"Contgratulazioni, il tuo nuovo eroe è un {newEroe.TipoEroe} di nome: {newEroe.NomeEroe} e combatterà con: {newEroe.Arma.NomeArma}");

            }
        }
    }
}