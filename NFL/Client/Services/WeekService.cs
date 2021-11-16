using NFL.Client.Extensions;
using NFL.Shared.ModelsDTO;
using NFL.Shared.ModelsNfl;
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

        public async Task<Games> scoresService(int week)
        {
            using (var client = new HttpClient())
            {
                var url = $"https://api.nfl.com/experience/v1/games?season=2021&seasonType=REG&week={week}/";
                client.DefaultRequestHeaders.Add("Authorization", "Bearer " + "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjbGllbnRJZCI6ImU1MzVjN2MwLTgxN2YtNDc3Ni04OTkwLTU2NTU2ZjhiMTkyOCIsImRtYUNvZGUiOiItMSIsImZvcm1GYWN0b3IiOiJERVNLVE9QIiwiaXNzIjoiTkZMIiwiZGV2aWNlSWQiOiJmZGUwZWEwNy1kNTM5LTQ5ZWEtYjA0OS1mZDk1NjFhNjI5M2MiLCJwbGF0Zm9ybSI6IkRFU0tUT1AiLCJwcm9kdWN0TmFtZSI6IldFQiIsInBsYW5zIjpbeyJzb3VyY2UiOiJORkwiLCJwbGFuIjoiZnJlZSIsInRyaWFsIjoiZmFsc2UiLCJzdGF0dXMiOiJBQ1RJVkUiLCJleHBpcmF0aW9uRGF0ZSI6IjIwMjItMTEtMTUifV0sImNvdW50cnlDb2RlIjoiTVgiLCJjZWxsdWxhciI6ZmFsc2UsImJyb3dzZXIiOiJDaHJvbWUiLCJEaXNwbGF5TmFtZSI6IldFQl9ERVNLVE9QX0RFU0tUT1AiLCJsdXJhQXBwS2V5IjoiU1pzNTdkQkdSeGJMNzI4bFZwN0RZUSIsImRtYSI6Ii0xIiwiZXhwIjoxNjM2OTM4NjEzLCJOb3RlcyI6IiJ9.wGBodLywarnptKy1GIY7Z8Yu9_J_64S-tTMGAcHG6nQ");
                //var response = await _HttpClient.GetStringAsync(url);
                var response = await client.GetFromJsonAsync<Games>(url);
                if (response != null)
                {
                    return response;
                }
                else
                {
                    return null;
                }
            }
        }
    }
}
