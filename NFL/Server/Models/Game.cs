using System;
using System.Collections.Generic;

#nullable disable

namespace NFL.Server.Models
{
    public partial class Game
    {
        public Game()
        {
            ForecastDetails = new HashSet<ForecastDetail>();
        }

        public int Id { get; set; }
        public int? WeekId { get; set; }
        public DateTime? Date { get; set; }
        public string Visitor { get; set; }
        public string Local { get; set; }
        public int? VisitorScore { get; set; }
        public int? LocalScore { get; set; }
        public int? Status { get; set; }
        public string Win { get; set; }

        public virtual Team LocalNavigation { get; set; }
        public virtual Team VisitorNavigation { get; set; }
        public virtual Week Week { get; set; }
        public virtual Team WinNavigation { get; set; }
        public virtual ICollection<ForecastDetail> ForecastDetails { get; set; }
    }
}
