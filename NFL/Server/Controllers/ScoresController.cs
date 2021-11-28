using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NFL.Shared.NFLModels;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Threading.Tasks;

namespace NFL.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ScoresController : ControllerBase
    {

        [HttpGet]
        public async Task<Root> GetScores()
        {
            Root root = new Root();
            using(var httpClient = new HttpClient())
            {
                var token = await httpClient.GetStringAsync("http://localhost:3000");
                httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
                var resp = await httpClient.GetFromJsonAsync<Root>("https://api.nfl.com/experience/v1/games?season=2021&seasonType=REG&week=11");            
                if(resp != null)
                {
                    root = resp;
                }
            }
            return root;
        }

    }
}
