﻿using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NFL.Server.Models;
using NFL.Shared.ModelsDTO;
using System.Linq;
using System.Threading.Tasks;

namespace NFL.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class WeeksController : ControllerBase
    {
        private readonly apiContext _context;
        private readonly IMapper _mapper;

        public WeeksController(apiContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<WeekDTO>> Get(int id)
        {
            var week = await _context.Weeks.Where(x => x.Id == id).
                                            Include(x=> x.Games).
                                            ThenInclude(x=> x.LocalNavigation).
                                            Include(z=> z.Games).
                                            ThenInclude(z=> z.VisitorNavigation).
                                            FirstOrDefaultAsync();
            var result = _mapper.Map<WeekDTO>(week);
            return result;
        }
        [HttpGet("last")]
        public async Task<ActionResult<WeekDTO>> GetLast()
        {
            var week = await _context.Weeks.Where(x => x.Status == 1 || x.Status==2).
                                            Include(x => x.Games).
                                            ThenInclude(x => x.LocalNavigation).
                                            Include(z => z.Games).
                                            ThenInclude(z => z.VisitorNavigation).
                                            FirstOrDefaultAsync();
            var result = _mapper.Map<WeekDTO>(week);
            return result;
        }
    }
}