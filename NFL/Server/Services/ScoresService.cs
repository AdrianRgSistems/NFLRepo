using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using NFL.Server.Models;
using NFL.Shared.NFLModels;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;

namespace NFL.Server.Services
{
    public class ScoresService : IHostedService, IDisposable
    {
        private readonly HttpClient httpClient;
        private readonly IConfiguration configuration;
        private Timer _timer;
        private Timer _timerScores;
        private string token;
        private string connectionString;

        public ScoresService(HttpClient httpClient, IConfiguration Configuration)
        {
            this.httpClient=httpClient;
            configuration=Configuration;
        }

        public static List<teamScore> _scores = new List<teamScore>();

        public void Dispose()
        {
            _timer?.Dispose();
            _timerScores?.Dispose();
        }

        public Task StartAsync(CancellationToken cancellationToken)
        {
            connectionString = Environment.GetEnvironmentVariable("CONECCTION_STRING");
            if (string.IsNullOrEmpty(connectionString)) connectionString = configuration.GetConnectionString("DefaultConnection");
            _timer = new Timer(GetToken, null, TimeSpan.Zero, TimeSpan.FromMinutes(30));
            _timerScores = new Timer(GetScores, null, TimeSpan.Zero, TimeSpan.FromMinutes(1));
            return Task.CompletedTask;
        }

        public Task StopAsync(CancellationToken cancellationToken)
        {
            _timer?.Change(Timeout.Infinite, 0);
            _timerScores?.Change(Timeout.Infinite, 0);
            return Task.CompletedTask;
        }

        private void GetToken(Object state)
        {
            try
            {
                token = Environment.GetEnvironmentVariable("NFL_TOKEN");
            }
            catch (Exception)
            {

                token = "";
            }
            if (!string.IsNullOrEmpty(token))
            {
                GetScores(10);
            }
        }

        private void GetScores(Object State)
        {
            token = Environment.GetEnvironmentVariable("NFL_TOKEN");
            if (!string.IsNullOrEmpty(token))
            {
                try
                {
                    httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
                    var resp = httpClient.GetFromJsonAsync<Root>("https://api.nfl.com/experience/v1/games?season=2021&seasonType=REG&week=13");
                    resp.Wait();
                    var scores = resp.Result;
                    if (scores != null)
                    {
                        using (var context = new apiContext(connectionString))
                        {
                            foreach (var game in scores.games)
                            {
                                if (game.detail !=null)
                                {
                                    var gameSet = context.Games.Where(x => x.Local == game.homeTeam.abbreviation && x.Visitor == game.awayTeam.abbreviation).FirstOrDefaultAsync();
                                    gameSet.Wait();
                                    var gameResult = gameSet.Result;
                                    gameResult.LocalScore = game.detail.homePointsTotal;
                                    gameResult.VisitorScore = game.detail.visitorPointsTotal;
                                    gameResult.Status = getStatus(game.detail.phase);
                                    if (gameResult.Status ==3)
                                    {
                                        if (gameResult.LocalScore > gameResult.VisitorScore) gameResult.Win = gameResult.Local;
                                        if (gameResult.LocalScore < gameResult.VisitorScore) gameResult.Win = gameResult.Visitor;
                                        if (gameResult.LocalScore == gameResult.VisitorScore) gameResult.Win = null;
                                    }
                                    context.Games.Update(gameResult);
                                    context.SaveChanges();
                                }
                            }
                        }
                    }
                    else
                    {
                        Environment.SetEnvironmentVariable("NFL_TOKEN", "");
                    }
                }
                catch (Exception)
                {
                    Environment.SetEnvironmentVariable("NFL_TOKEN", "");
                }
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

    public class teamScore
    {
        public string name { get; set; }
        public int score { get; set; }
    }
}
