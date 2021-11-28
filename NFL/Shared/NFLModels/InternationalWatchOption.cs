using System.Collections.Generic;

namespace NFL.Shared.NFLModels
{

    public class InternationalWatchOption
    {
        public string countryCode { get; set; }
        public List<string> broadcasters { get; set; }
    }

}