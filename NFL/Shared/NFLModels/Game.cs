using System.Collections.Generic;
using System;

namespace NFL.Shared.NFLModels
{
    public class Game
    {
        public string id { get; set; }
        public HomeTeam homeTeam { get; set; }
        public AwayTeam awayTeam { get; set; }
        public string category { get; set; }
        public string date { get; set; }
        public DateTime time { get; set; }
        public BroadcastInfo broadcastInfo { get; set; }
        public Venue venue { get; set; }
        public int season { get; set; }
        public string seasonType { get; set; }
        public string status { get; set; }
        public int week { get; set; }
        public string weekType { get; set; }
        public List<ExternalId> externalIds { get; set; }
        public string ticketUrl { get; set; }
        public Detail detail { get; set; }
    }

}