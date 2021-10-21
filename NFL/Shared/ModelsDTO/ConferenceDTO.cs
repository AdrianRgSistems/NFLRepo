using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NFL.Shared.ModelsDTO
{
    public class ConferenceDTO
    {
        public int Id { get; set; }
        public string Conference1 { get; set; }
        public string ConferenceShort { get; set; }
        public string Alias { get; set; }

        public virtual ICollection<DivisionDTO> Divisions { get; set; }
    }
}
