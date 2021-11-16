using System;
using System.Collections.Generic;

namespace NFL.Server.Models
{
    public partial class Forecast
    {
        public Forecast()
        {
            ForecastDetails = new HashSet<ForecastDetail>();
            SpoolWinners = new HashSet<SpoolWinner>();
        }

        public int Idforecast { get; set; }
        public int? IdWeek { get; set; }
        public string IdUser { get; set; }
        public int? Hits { get; set; }
        public int? Tiebreaker { get; set; }

        public virtual AspNetUser IdUserNavigation { get; set; }
        public virtual Week IdWeekNavigation { get; set; }
        public virtual ICollection<ForecastDetail> ForecastDetails { get; set; }
        public virtual ICollection<SpoolWinner> SpoolWinners { get; set; }
    }
}
