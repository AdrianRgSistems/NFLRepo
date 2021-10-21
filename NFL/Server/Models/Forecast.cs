using System;
using System.Collections.Generic;

#nullable disable

namespace NFL.Server.Models
{
    public partial class Forecast
    {
        public Forecast()
        {
            ForecastDetails = new HashSet<ForecastDetail>();
        }

        public int Idforecast { get; set; }
        public int? IdWeek { get; set; }
        public string IdUser { get; set; }
        public int? Hits { get; set; }
        public int? Tiebreaker { get; set; }

        public virtual AspNetUser IdUserNavigation { get; set; }
        public virtual Week IdWeekNavigation { get; set; }
        public virtual ICollection<ForecastDetail> ForecastDetails { get; set; }
    }
}
