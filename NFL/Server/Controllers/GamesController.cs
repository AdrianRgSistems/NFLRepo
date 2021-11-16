using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using NFL.Shared.ModelsDTO;
using NFL.Server.Models;
using AutoMapper;
using System.Threading.Tasks;
using NFL.Shared.Wrapper;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using System;


// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace NFL.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GamesController : ControllerBase
    {
        private readonly apiContext _context;
        private readonly IMapper _mapper;

        public GamesController(apiContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        // PUT api/<GamesController>/5
        [HttpPut]
        public async Task<Shared.Wrapper.IResult> Put(GameDTO game)
        {
            var week = game.WeekId.Value;
            try
            {
                var data = _mapper.Map<Game>(game);
                await checkWeek(week);
                _context.Entry(data).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                //_context.Games.Update(data);
                await _context.SaveChangesAsync();
                return await Result.SuccessAsync();
            }
            catch (System.Exception)
            {
                return await Result.FailAsync();
            }
        }

        private async Task checkWeek(int weekId)
        {
            var week = await _context.Weeks.FindAsync(weekId);
            await setWinner(week);
            var rest = week.Games.Count(x=> x.Status != 3);
            if(rest == 0)
            {
                var lastGame = week.Games.LastOrDefault();
                week.Status = 3;
                week.LastScore = lastGame.VisitorScore + lastGame.LocalScore;
                _context.Weeks.Update(week);
                await _context.SaveChangesAsync();
            }   
        }

        private async Task setWinner(Week week)
        {
            var winner = new List<Forecast>();
            var forecasts = await _context.Forecasts.Where(x => x.IdWeek == week.Id).Include(x=> x.IdUserNavigation).OrderByDescending(x=> x.Hits).ToListAsync();
            var top = forecasts.Max(x=>x.Hits).Value;
            var winners = forecasts.Where(x=> x.Hits== top).ToList();
            if (winners.Count > 1)
            {
                var dif = 10000;
                foreach (var item in winners)
                {
                    var d = item.Tiebreaker.Value - week.LastScore.Value;
                    var difreal = Math.Abs(d);
                    if (difreal <= dif)
                    {
                        if(difreal == dif)
                        {
                            winner.Add(item);
                        }
                        else
                        {
                            winner.Clear();
                            winner.Add(item);
                        }
                        dif = difreal;
                    }
                }
            }
            else
            {
                winner = winners;
            }
        }


    }


}

