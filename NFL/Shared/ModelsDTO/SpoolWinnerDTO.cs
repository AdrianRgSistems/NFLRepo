namespace NFL.Shared.ModelsDTO
{
    public class SpoolWinnerDTO
    {
        public int IdspoolWinners { get; set; }
        public int? SpoolId { get; set; }
        public string IdUser { get; set; }
        public decimal? Amount { get; set; }
        public int? IdForecast { get; set; }

        public virtual ForecastDTO IdForecastNavigation { get; set; }
        public virtual AspNetUserDTO IdUserNavigation { get; set; }
        //public virtual SpoolDTO Spool { get; set; }
    }
}