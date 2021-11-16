using System;
using System.Collections.Generic;

namespace NFL.Server.Models
{
    public partial class Week
    {
        public Week()
        {
            Forecasts = new HashSet<Forecast>();
            Games = new HashSet<Game>();
            Spools = new HashSet<Spool>();
        }

        public int Id { get; set; }
        public int? WeekNumber { get; set; }
        public string WeekName { get; set; }
        public int? ScheduleId { get; set; }
        public int? Status { get; set; }
        public int? LastScore { get; set; }

        public virtual Schedule Schedule { get; set; }
        public virtual ICollection<Forecast> Forecasts { get; set; }
        public virtual ICollection<Game> Games { get; set; }
        public virtual ICollection<Spool> Spools { get; set; }
    }
}
