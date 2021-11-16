using System;
using System.Collections.Generic;

namespace NFL.Server.Models
{
    public partial class Spool
    {
        public Spool()
        {
            SpoolWinners = new HashSet<SpoolWinner>();
        }

        public int Idspool { get; set; }
        public int? Participants { get; set; }
        public int? WeekId { get; set; }
        public decimal? Amount { get; set; }
        public int? Winners { get; set; }

        public virtual Week Week { get; set; }
        public virtual ICollection<SpoolWinner> SpoolWinners { get; set; }
    }
}
