namespace NFL.Shared.ModelsNfl
{
    public class Detail
    {
        public string id { get; set; }
        public string gameClock { get; set; }
        public int homePointsTotal { get; set; }
        public object period { get; set; }
        public string phase { get; set; }
        public PossessionTeam possessionTeam { get; set; }
        public int visitorPointsTotal { get; set; }
    }

}