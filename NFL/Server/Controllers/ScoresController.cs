using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NFL.Server.Models;
using NFL.Shared.ModelsNfl;
using NFL.Shared.NFLModels;
using System;
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
            Root root = new Root();
            using (var httpClient = new HttpClient())
            {
                httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token.Token);
                var resp = await httpClient.GetFromJsonAsync<Root>("https://api.nfl.com/experience/v1/games?season=2021&seasonType=REG&week=12");
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
                }
            }
            return true;
            }
            catch (System.Exception)
            {
                return false;
            }
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