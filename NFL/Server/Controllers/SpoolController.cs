using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using NFL.Server.Models;
using NFL.Server.Services;
using NFL.Shared.ModelsDTO;
using NFL.Shared.Wrapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace NFL.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SpoolController : ControllerBase
    {
        private readonly apiContext _context;
        private readonly IMapper _mapper;
        private readonly IHubContext<HubService> hubcontex;
        public SpoolController(apiContext context, IMapper mapper, IHubContext<HubService> hubcontex)
        {
            _context = context;
            _mapper = mapper;
            this.hubcontex=hubcontex;
        }

        // GET: api/<SpoolController>
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<SpoolController>/5
        [HttpGet("{id}")]
        public async Task<SpoolDTO> GetByWeek(int id)
        {
            var res = await _context.Spools.Where(x => x.WeekId == id)
                                            .Include(x=> x.SpoolWinners)
                                            .ThenInclude(x=>x.IdUserNavigation)
                                            .Include(x=>x.SpoolWinners)
                                            .ThenInclude(x=> x.IdForecastNavigation)
                                            .FirstOrDefaultAsync();
            var responce = _mapper.Map<SpoolDTO>(res);
            return responce;
        }

        // POST api/<SpoolController>
        [HttpPost]
        public async Task<Shared.Wrapper.IResult> Post(SpoolDTO spool)
        {
            var newspool = _mapper.Map<Spool>(spool);
            await _context.Spools.AddAsync(newspool);
            await _context.SaveChangesAsync();
            await hubcontex.Clients.All.SendAsync("UpdateData");
            return await Result.SuccessAsync();
        }

        // PUT api/<SpoolController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<SpoolController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }

    }
}
