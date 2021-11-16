using System.Collections.Generic;

namespace NFL.Shared.ModelsNfl
{
    public class BroadcastInfo
    {
        public List<string> homeNetworkChannels { get; set; }
        public List<string> awayNetworkChannels { get; set; }
        public List<InternationalWatchOption> internationalWatchOptions { get; set; }
        public string territory { get; set; }
    }

}