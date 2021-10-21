using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NFL.Shared.ModelsDTO
{
    public class TeamDTO
    {

        public int IdTeam { get; set; }
        public string TeamName { get; set; }
        public string LastName { get; set; }
        public string Alias { get; set; }
        public int? DivisionId { get; set; }
        public string ImageUrl { get; set; }

        //public virtual DivisionDTO Division { get; set; }
        //public virtual ICollection<GameDTO> GameLocalNavigations { get; set; }
        //public virtual ICollection<GameDTO> GameVisitorNavigations { get; set; }
    }
}
