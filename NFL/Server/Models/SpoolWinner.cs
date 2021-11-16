using System;
using System.Collections.Generic;

namespace NFL.Server.Models
{
    public partial class SpoolWinner
    {
        public int IdspoolWinners { get; set; }
        public int? SpoolId { get; set; }
        public string IdUser { get; set; }
        public decimal? Amount { get; set; }
        public int? IdForecast { get; set; }

        public virtual Forecast IdForecastNavigation { get; set; }
        public virtual AspNetUser IdUserNavigation { get; set; }
        public virtual Spool Spool { get; set; }
    }
}
