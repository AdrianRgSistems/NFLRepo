using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NFL.Shared.ModelsDTO
{
    public class ForecastDTO
    {
        public int Idforecast { get; set; }
        public int? IdWeek { get; set; }
        public string IdUser { get; set; }
        public int? Hits { get; set; }
        public int? Tiebreaker { get; set; }

        public virtual AspNetUserDTO IdUserNavigation { get; set; }
        public virtual WeekDTO IdWeekNavigation { get; set; }
        public virtual ICollection<ForecastDetailDTO> ForecastDetails { get; set; }
    }
}
