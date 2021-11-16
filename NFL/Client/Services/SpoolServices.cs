using NFL.Client.Extensions;
using NFL.Shared.ModelsDTO;
using NFL.Shared.Wrapper;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;

namespace NFL.Client.Services
{
    public class SpoolServices : ISpoolServices
    {
        private readonly HttpClient _HttpClient;

        public SpoolServices(HttpClient httpClient)
        {
            _HttpClient = httpClient;
        }

        public async Task<IResult> AddAsync(SpoolDTO spool)
        {
            var result = await _HttpClient.PostAsJsonAsync("api/Spool", spool);
            var resul = await result.ToResult();
            return resul;
        }
    }
}
