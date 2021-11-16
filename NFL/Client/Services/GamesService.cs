using NFL.Client.Extensions;
using NFL.Shared.ModelsDTO;
using NFL.Shared.Wrapper;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;

namespace NFL.Client.Services
{
    public class GamesService : IGamesService
    {
        private readonly HttpClient httpClient;

        public GamesService(HttpClient httpClient)
        {
            this.httpClient = httpClient;
        }

        public async Task<IResult> EditForecast(GameDTO game)
        {
            var final = await httpClient.PutAsJsonAsync("api/games", game);
            var result = await final.ToResult();
            return result;
        }
    }
}
