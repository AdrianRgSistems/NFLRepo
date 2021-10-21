using System;
using System.Collections.Generic;

#nullable disable

namespace NFL.Server.Models
{
    public partial class Conference
    {
        public Conference()
        {
            Divisions = new HashSet<Division>();
        }

        public int Id { get; set; }
        public string Conference1 { get; set; }
        public string ConferenceShort { get; set; }
        public string Alias { get; set; }

        public virtual ICollection<Division> Divisions { get; set; }
    }
}
