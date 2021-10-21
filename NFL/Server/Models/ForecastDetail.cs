using System;
using System.Collections.Generic;

#nullable disable

namespace NFL.Server.Models
{
    public partial class ForecastDetail
    {
        public int Id { get; set; }
        public int? ForecastId { get; set; }
        public int? Game { get; set; }
        public string Win { get; set; }
        public int? Set { get; set; }
        public int? IsCorrect { get; set; }

        public virtual Forecast Forecast { get; set; }
        public virtual Game GameNavigation { get; set; }
        public virtual Team WinNavigation { get; set; }
    }
}
