using NFL.Shared.ModelsDTO;
using NFL.Shared.Wrapper;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace NFL.Client.Services
{
    public interface IWeekService
    {
        Task<IResult> EditWeek(WeekDTO week);
        Task<IEnumerable<WeekDTO>> GetAllAsync();
    }
}