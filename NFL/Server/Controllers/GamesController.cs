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
using Microsoft.AspNetCore.Authorization;


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

        [Authorize(Roles = "Admin")]
        // PUT api/<GamesController>/5
        [HttpPut]
        public async Task<Shared.Wrapper.IResult> Put(GameDTO game)
        {

            var week = game.WeekId.Value;
            try
            {
                var data = _mapper.Map<Game>(game);
                _context.Entry(data).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                //_context.Games.Update(data);
                await _context.SaveChangesAsync();
                await checkWeek(week);
                return await Result.SuccessAsync();
            }
            catch (System.Exception)
            {
                return await Result.FailAsync();
            }
        }

        private async Task checkWeek(int weekId)
        {
            var games = await _context.Games.Where(x=>x.WeekId == weekId).ToListAsync();
            var week = await _context.Weeks.FirstOrDefaultAsync(x=>x.Id==weekId);
            var rest = games.Count(x => x.Status != 3);
            if (rest == 0)
            {
                var lastGame = games.LastOrDefault();
                week.Status = 3;
                week.LastScore = lastGame.VisitorScore + lastGame.LocalScore;
                _context.Weeks.Update(week);
                await _context.SaveChangesAsync();
                await setWinner(week);
            }
        }

        private async Task setWinner(Week week)
        {
            var winner = new List<Forecast>();
            var forecasts = await _context.Forecasts.Where(x => x.IdWeek == week.Id).Include(x => x.IdUserNavigation).OrderByDescending(x => x.Hits).ToListAsync();
            var top = forecasts.Max(x => x.Hits).Value;
            var winners = forecasts.Where(x => x.Hits == top).ToList();
            if (winners.Count > 1)
            {
                var dif = 10000;
                foreach (var item in winners)
                {
                    var d = item.Tiebreaker.Value - week.LastScore.Value;
                    var difreal = Math.Abs(d);
                    if (difreal <= dif)
                    {
                        if (difreal == dif)
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
            await SaveWinners(winner, week.Id);
        }

        private async Task SaveWinners(List<Forecast> winners, int weekid)
        {
            var spool = await _context.Spools.FirstOrDefaultAsync(x => x.WeekId == weekid);
            spool.Winners = winners.Count();
            var ganado = spool.Amount / winners.Count();
            foreach (var item in winners)
            {
                var winner = new SpoolWinner { Amount = ganado, IdForecast = item.Idforecast, IdUser = item.IdUser };
                spool.SpoolWinners.Add(winner);
            }
            _context.Spools.Update(spool);
            await _context.SaveChangesAsync();
        }


    }


}

