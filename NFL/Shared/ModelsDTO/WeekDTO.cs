using System.Collections.Generic;

namespace NFL.Shared.ModelsDTO
{
    public class WeekDTO
    {

        public int Id { get; set; }
        public int? WeekNumber { get; set; }
        public string WeekName { get; set; }
        public int? ScheduleId { get; set; }
        public int? Status { get; set; }
        public int? LastScore { get; set; }

        //public virtual ScheduleDTO Schedule { get; set; }
        public virtual ICollection<GameDTO> Games { get; set; }
    }
}