using System;
using System.Collections.Generic;

#nullable disable

namespace NFL.Server.Models
{
    public partial class Division
    {
        public Division()
        {
            Teams = new HashSet<Team>();
        }

        public int Id { get; set; }
        public string DivisionsName { get; set; }
        public int? IdConference { get; set; }

        public virtual Conference IdConferenceNavigation { get; set; }
        public virtual ICollection<Team> Teams { get; set; }
    }
}
