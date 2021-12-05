using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.SignalR;
using System;
using System.Threading.Tasks;

namespace NFL.Server.Services
{
    public class HubService : Hub
    {
        public async Task Send()
        {
            await Clients.All.SendAsync("UpdateData");
        }

        public override Task OnConnectedAsync()
        {
            var id = Context.ConnectionId;
            Console.WriteLine(id);
            return base.OnConnectedAsync();
        }
    }
}
