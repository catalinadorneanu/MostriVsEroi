using System.Collections.Generic;

namespace MostriVsEroi.Core
{
    public class Eroe
    {
        //Se si sceglie “Crea nuove eroe”, l’applicazione chiederà all’utente di inserire il nome dell’eroe, la categoria
        //dell’eroe, l’arma e visualizzerà il messaggio “Eroe inserito” e ritornerà al Menù 2
        public int IdEroe { get; set; }
        public string NomeEroe { get; set; }
        public Categoria Categoria { get; set; } = new Categoria();
        public Arma Arma { get; set; } = new Arma();
        public int Livello { get; }
        public int PuntiVita { get; set; }
        public int PuntiAccumulati { get; set; }
        public Eroe()
        {

        }
        public Eroe(int idEroe,string nomeEroe, Categoria categoria, Arma arma, int livello, int puntiVita, int puntiAccumulati )
        {
            IdEroe = idEroe;
            NomeEroe = nomeEroe;
            Categoria = categoria;
            Arma = arma;
            Livello = 1;
            PuntiVita = 20;
            PuntiAccumulati = 0;

        }

        //public string GetEroe()
        //{
        //    return $"\nEroe:{NomeEroe}, Categoria: {TipoEroe}, Arma:{Arma}, Livello: {Livello}, Punti Vita: {PuntiVita}, Punti Accumulati: {PuntiAccumulati}";
        //}
    }

}
