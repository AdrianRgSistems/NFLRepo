using System;

namespace NFL.Shared.ModelsDTO
{
    public class GameDTO
    {
        public int Id { get; set; }
        public int? WeekId { get; set; }
        public DateTime? Date { get; set; }
        public string Visitor { get; set; }
        public string Local { get; set; }
        public int? VisitorScore { get; set; }
        public int? LocalScore { get; set; }
        public int? Status { get; set; }
        public string Win { get; set; }
        public virtual TeamDTO LocalNavigation { get; set; }
        public virtual TeamDTO VisitorNavigation { get; set; }
        //public virtual WeekDTO Week { get; set; }
    }
}