using NFL.Shared.ModelsDTO;
using NFL.Shared.Wrapper;
using System.Threading.Tasks;

namespace NFL.Client.Services
{
    public interface ISpoolServices
    {
        Task<IResult> AddAsync(SpoolDTO spool);
    }
}