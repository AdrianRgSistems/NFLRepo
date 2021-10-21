using NFL.Shared.ModelsDTO;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;
using NFL.Client.Extensions;
using NFL.Shared.Wrapper;

namespace NFL.Client.Services
{
    public class ForecastService : IForecastService
    {

        private readonly HttpClient _HttpClient;

        public ForecastService(HttpClient httpClient)
        {
            _HttpClient = httpClient;
        }

        public async Task<IResult<List<ForecastDTO>>> GetForecastAsync()
        {
            var response = await _HttpClient.GetAsync("api/forecast");
            if (response.IsSuccessStatusCode)
            {
                return await response.ToResult<List<ForecastDTO>>(); ;
            }
            else
            {
                return null;
            }
        }

        public async Task<IResult<ForecastDTO>> GetLastForecastAsync()
        {
            var response = await _HttpClient.GetAsync("api/forecast/last");
            if (response.IsSuccessStatusCode)
            {
                return await response.ToResult<ForecastDTO>();
            }
            else
            {
                return null;
            }
        }

        public async Task<IResult> PostForecastASync(int idWeek)
        {
            var resp = await _HttpClient.GetFromJsonAsync<WeekDTO>("/api/Weeks/last");
            var forecaste = new ForecastDTO()
            {
                IdWeek = resp.Id,
                Hits = 0,
                Tiebreaker = 0,
                ForecastDetails = new List<ForecastDetailDTO>()
            };
            foreach (var item in resp.Games)
            {
                forecaste.ForecastDetails.Add(new ForecastDetailDTO { Game = item.Id, Set = 0, IsCorrect = 0 });
            }

            var final = await _HttpClient.PostAsJsonAsync("api/forecast", forecaste);
            var result = await final.ToResult();
            return result;
        }

        public async Task<IResult> EditForecast(ForecastDTO forecast)
        {
            var final = await _HttpClient.PutAsJsonAsync("api/forecast", forecast);
            var result = await final.ToResult();
            return result;
        }
    }
}
