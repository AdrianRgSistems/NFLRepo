using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;

namespace NFL.Server.Services
{
    public static class ScoresService
    {

        public static List<teamScore> _scores = new List<teamScore>();
        public static async Task UpdateScores(int week)
        {
                await Task.Delay(10);
                IWebDriver driver = new ChromeDriver();
                driver.Navigate().GoToUrl($"https://www.nfl.com/schedules/2021/REG{week}/");

                var scores = driver.FindElements(By.ClassName(".css-k15rmy"));
                //var scoresPre = driver.FindElements(By.CssSelector(".sb-score .pregame"));
                foreach (var item in scores)
                {
                    var teams = item.FindElements(By.CssSelector(".css1n120i4"));
                    foreach (var team in teams)
                    {
                        var away = item.FindElement(By.CssSelector(".css-15fzge"));
                        var awayNAme = away.Text;
                        var tota = item.FindElement(By.CssSelector(".css-xqgvjw span"));
                        var awayTotal = tota.Text;
                        _scores.Add(new teamScore { name = awayNAme, score = int.Parse(awayTotal) });
                    }
                }
        }
    }

    public class teamScore
    {
        public string name { get; set; }
        public int score { get; set; }
    }
}
