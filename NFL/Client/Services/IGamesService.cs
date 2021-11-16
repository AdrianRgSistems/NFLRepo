using NFL.Shared.ModelsDTO;
using NFL.Shared.Wrapper;
using System.Threading.Tasks;

namespace NFL.Client.Services
{
    public interface IGamesService
    {
        Task<IResult> EditForecast(GameDTO game);
    }
}