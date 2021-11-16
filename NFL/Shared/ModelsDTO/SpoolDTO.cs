using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NFL.Shared.ModelsDTO
{
    public class SpoolDTO
    {
        public int Idspool { get; set; }
        public int? Participants { get; set; }
        public int? WeekId { get; set; }
        public decimal? Amount { get; set; }
        public int? Winners { get; set; }

        public virtual WeekDTO Week { get; set; }
        public virtual ICollection<SpoolWinnerDTO> SpoolWinners { get; set; }
    }
}
