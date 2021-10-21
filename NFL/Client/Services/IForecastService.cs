using NFL.Shared.ModelsDTO;
using NFL.Shared.Wrapper;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace NFL.Client.Services
{
    public interface IForecastService
    {
        Task<IResult> EditForecast(ForecastDTO forecast);
        Task<IResult<List<ForecastDTO>>> GetForecastAsync();
        Task<IResult<ForecastDTO>> GetLastForecastAsync();
        Task<IResult> PostForecastASync(int idWeek);
    }
}