using MostriVsEroi.Core;

namespace MostriVsEroi.Core
{
    public class Mostro
    //Se si sceglie “Crea nuovo mostro”, verrà chiesto di inserire il nome del mostro, la categoria del mostro,
    //l’arma del mostro e il livello.
    {
        public string NomeMostro { get; set; }
        public string TipoMostro { get; set; }
        public Arma Arma { get; set; } = new Arma();
        public int LivelloMostro { get; set; }
        public int PuntiVita { get; set; }
        public Mostro()
        {

        }
        public Mostro(string nomeMostro, string tipoMostro, Arma arma, int livelloMostro, int puntiVita)
        {
            NomeMostro = nomeMostro;
            TipoMostro = tipoMostro;
            Arma = arma;
            LivelloMostro = livelloMostro;
            PuntiVita = puntiVita;
        }
    }


}