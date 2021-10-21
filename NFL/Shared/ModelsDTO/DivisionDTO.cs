using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NFL.Shared.ModelsDTO
{
    public class DivisionDTO
    {
        public int Id { get; set; }
        public string DivisionsName { get; set; }
        public int? IdConference { get; set; }

        //public virtual ConferenceDTO IdConferenceNavigation { get; set; }
        public virtual ICollection<TeamDTO> Teams { get; set; }
    }
}
