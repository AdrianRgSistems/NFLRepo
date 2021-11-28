using System.Collections.Generic;

namespace NFL.Shared.NFLModels
{

    public class HomeTeam
    {
        public string id { get; set; }
        public string currentLogo { get; set; }
        public string fullName { get; set; }
        public string abbreviation { get; set; }
        public string season { get; set; }
        public string conferenceAbbr { get; set; }
        public string conferenceFullName { get; set; }
        public string divisionFullName { get; set; }
        public string league { get; set; }
        public string location { get; set; }
        public string nickName { get; set; }
        public string primaryColor { get; set; }
        public string secondaryColor { get; set; }
        public int yearEstablished { get; set; }
        public string nflShopUrl { get; set; }
        public string officialWebsiteUrl { get; set; }
        public string owners { get; set; }
        public string teamType { get; set; }
        public List<Social> socials { get; set; }
        public List<Venue> venues { get; set; }
    }

}