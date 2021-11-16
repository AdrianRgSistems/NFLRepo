using System;
using System.Collections.Generic;

namespace NFL.Server.Models
{
    public partial class Schedule
    {
        public Schedule()
        {
            Weeks = new HashSet<Week>();
        }

        public int Id { get; set; }
        public int? Year { get; set; }

        public virtual ICollection<Week> Weeks { get; set; }
    }
}
