namespace MostriVsEroi.Core
{
    public class Arma
    {
        public string NomeArma { get; set; }
        public int PuntiDanno { get; set; }
        public Arma()
        {

        }
        public Arma(string nomeArma, int puntiDanno)
        {
            NomeArma = nomeArma;
            PuntiDanno = puntiDanno;
        }

       //public string GetArma()
       // {
       //     return $"{NomeArma}, {PuntiDanno}";
       // }
    }
}