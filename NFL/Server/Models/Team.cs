using System;
using System.Collections.Generic;

namespace NFL.Server.Models
{
    public partial class Team
    {
        public Team()
        {
            ForecastDetails = new HashSet<ForecastDetail>();
            GameLocalNavigations = new HashSet<Game>();
            GameVisitorNavigations = new HashSet<Game>();
            GameWinNavigations = new HashSet<Game>();
        }

        public int IdTeam { get; set; }
        public string TeamName { get; set; }
        public string LastName { get; set; }
        public string Alias { get; set; }
        public int? DivisionId { get; set; }
        public string ImageUrl { get; set; }

        public virtual Division Division { get; set; }
        public virtual ICollection<ForecastDetail> ForecastDetails { get; set; }
        public virtual ICollection<Game> GameLocalNavigations { get; set; }
        public virtual ICollection<Game> GameVisitorNavigations { get; set; }
        public virtual ICollection<Game> GameWinNavigations { get; set; }
    }
}
