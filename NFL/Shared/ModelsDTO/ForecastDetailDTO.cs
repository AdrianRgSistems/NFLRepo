using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NFL.Shared.ModelsDTO
{
    public class ForecastDetailDTO
    {
        public int Id { get; set; }
        public int? ForecastId { get; set; }
        public int? Game { get; set; }
        public string Win { get; set; }
        public int? Set { get; set; }
        public int? IsCorrect { get; set; }

        //public virtual ForecastDTO Forecast { get; set; }
        public virtual GameDTO GameNavigation { get; set; }
        public virtual TeamDTO WinNavigation { get; set; }
    }
}
