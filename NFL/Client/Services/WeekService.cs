using NFL.Client.Extensions;
using NFL.Shared.ModelsDTO;
using NFL.Shared.Wrapper;
using System.Collections;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;

namespace NFL.Client.Services
{
    public class WeekService : IWeekService
    {
        private readonly HttpClient httpClient;

        public WeekService(HttpClient httpClient)
        {
            this.httpClient = httpClient;
        }

        public async Task<IEnumerable<WeekDTO>> GetAllAsync()
        {
            var result = await httpClient.GetFromJsonAsync<IEnumerable<WeekDTO>>("api/Weeks");
            return result;
        }

        public async Task<IResult> EditWeek(WeekDTO week)
        {
            var result = await httpClient.PutAsJsonAsync("api/Weeks", week);
            var responce = await result.ToResult();
            return responce;
        }
    }
}
