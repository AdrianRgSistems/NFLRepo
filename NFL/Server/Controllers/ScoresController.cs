using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NFL.Server.Models;
using NFL.Shared.ModelsNfl;
using NFL.Shared.NFLModels;
using System;
using System.Collections.Generic;
using System.Linq;
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
        private readonly apiContext context;

        public ScoresController(apiContext contex)
        {
            this.context=contex;
        }

        [HttpPost]
        public async Task<ActionResult> GetScores([FromBody]TokenDTO token)
        {
            var week = Environment.GetEnvironmentVariable("NFL_WEEK");
            Root root = new Root();
            using (var httpClient = new HttpClient())
            {
                httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token.Token);
                var resp = await httpClient.GetFromJsonAsync<Root>("https://api.nfl.com/experience/v1/games?season=2021&seasonType=REG&week="+week);
                if (resp != null)
                {
                    Environment.SetEnvironmentVariable("NFL_TOKEN", token.Token);
                   var responce = await GetScores(resp);
                    return Ok();
                }
            }
            return BadRequest();
        }

        private async Task<bool> GetScores(Root scores)
        {
            try
            {

            foreach (var game in scores.games)
            {
                if (game.detail !=null)
                {
                    var gameSet = await context.Games.Where(x => x.Local == game.homeTeam.abbreviation && x.Visitor == game.awayTeam.abbreviation).FirstOrDefaultAsync();
                    gameSet.LocalScore = game.detail.homePointsTotal;
                    gameSet.VisitorScore = game.detail.visitorPointsTotal;
                    gameSet.Status = getStatus(game.detail.phase);
                    if (gameSet.Status ==3)
                    {
                        if (gameSet.LocalScore > gameSet.VisitorScore) gameSet.Win = gameSet.Local;
                        if (gameSet.LocalScore < gameSet.VisitorScore) gameSet.Win = gameSet.Visitor;
                        if (gameSet.LocalScore == gameSet.VisitorScore) gameSet.Win = null;
                    }
                    context.Games.Update(gameSet);
                    context.SaveChanges();
                    var week = gameSet.WeekId.Value;
                     await checkWeek(week);
                    }
            }
            return true;
            }
            catch (System.Exception)
            {
                return false;
            }
        }

        private async Task checkWeek(int weekId)
        {
            var games = await context.Games.Where(x => x.WeekId == weekId).ToListAsync();
            var week = await context.Weeks.FirstOrDefaultAsync(x => x.Id==weekId);
            var rest = games.Count(x => x.Status != 3);
            if (rest == 0)
            {
                var lastGame = games.LastOrDefault();
                week.Status = 3;
                week.LastScore = lastGame.VisitorScore + lastGame.LocalScore;
                context.Weeks.Update(week);
                await context.SaveChangesAsync();
                await setWinner(week);
            }
        }

        private async Task setWinner(Week week)
        {
            var winner = new List<Forecast>();
            var forecasts = await context.Forecasts.Where(x => x.IdWeek == week.Id).Include(x => x.IdUserNavigation).OrderByDescending(x => x.Hits).ToListAsync();
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
            var spool = await context.Spools.FirstOrDefaultAsync(x => x.WeekId == weekid);
            spool.Winners = winners.Count();
            var ganado = spool.Amount / winners.Count();
            foreach (var item in winners)
            {
                var winner = new SpoolWinner { Amount = ganado, IdForecast = item.Idforecast, IdUser = item.IdUser };
                spool.SpoolWinners.Add(winner);
            }
            context.Spools.Update(spool);
            await context.SaveChangesAsync();
        }

        private int getStatus(string phase)
        {
            switch (phase)
            {
                case "PREGAME":
                    return 1;
                case "FINAL":
                    return 3;
                case "FINAL_OVERTIME":
                    return 3;
                default:
                    return 2;
            }
        }
    }
}