using System.Collections.Generic;


namespace NFL.Shared.NFLModels
{

    public class Root
    {
        public List<Game> games { get; set; }
        public Pagination pagination { get; set; }
    }

}