using AutoMapper;
using NFL.Server.Models;
using NFL.Shared.ModelsDTO;

namespace NFL.Server
{
    public class MapperConfig: Profile
    {
        public MapperConfig()
        {
            CreateMap<Week, WeekDTO>();
            CreateMap<WeekDTO, Week>();

            CreateMap<Game, GameDTO>();
            CreateMap<GameDTO, Game>();

            CreateMap<TeamDTO, Team>();
            CreateMap<Team, TeamDTO>();

            CreateMap<AspNetUser, AspNetUserDTO>();
            CreateMap<AspNetUserDTO, AspNetUser>();
            
            CreateMap<Forecast, ForecastDTO>();
            CreateMap<ForecastDTO, Forecast>();

            CreateMap<ForecastDetail, ForecastDetailDTO>();
            CreateMap<ForecastDetailDTO, ForecastDetail>();

            CreateMap<Spool, SpoolDTO>();
            CreateMap<SpoolDTO, Spool>();

            CreateMap<SpoolWinner, SpoolWinnerDTO>();
            CreateMap<SpoolWinnerDTO, SpoolWinner>();

        }
    }
}
