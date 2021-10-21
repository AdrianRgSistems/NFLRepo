using System.Collections.Generic;

namespace NFL.Shared.ModelsDTO
{
    public class ScheduleDTO
    {

        public int Id { get; set; }
        public int? Year { get; set; }

        public virtual ICollection<WeekDTO> Weeks { get; set; }
    }
}