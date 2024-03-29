﻿using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NFL.Server.Models;
using NFL.Shared.ModelsDTO;
using NFL.Shared.Wrapper;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MediatR;
using Microsoft.AspNetCore.SignalR;
using NFL.Server.Services;

namespace NFL.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class forecastController : ControllerBase
    {
        private readonly apiContext _context;
        private readonly IMapper _mapper;
        private readonly IHubContext<HubService> hubcontex;

        public forecastController(apiContext context, IMapper mapper, IHubContext<HubService> hubcontex)
        {
            _context = context;
            _mapper = mapper;
            this.hubcontex=hubcontex;
        }

        [HttpGet]
        public async Task<Microsoft.AspNetCore.Mvc.ActionResult> Get()
        {
            var user = User.FindFirst(x => x.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier").Value;
            var respo = await _context.Forecasts.Where(x => x.IdUser == user).
                                     Include(x => x.ForecastDetails).
                                     ThenInclude(x => x.GameNavigation).
                                     ThenInclude(x => x.VisitorNavigation).
                                     Include(x => x.ForecastDetails).
                                     ThenInclude(x => x.GameNavigation).
                                     ThenInclude(x => x.LocalNavigation).ToListAsync();
            var res = _mapper.Map<IEnumerable<ForecastDTO>>(respo);
            var response = await Result<IEnumerable<ForecastDTO>>.SuccessAsync(res);
            if (response != null) return Ok(response); else return NotFound();
        }


        [HttpGet("all/{week}")]
        public async Task<Microsoft.AspNetCore.Mvc.ActionResult> GetAllAsync(int week)
        {
            var respo = await _context.Forecasts.Where(x => x.IdWeek == week).
                                     Include(x => x.ForecastDetails).
                                     ThenInclude(x => x.GameNavigation).
                                     ThenInclude(x => x.VisitorNavigation).
                                     Include(x => x.ForecastDetails).
                                     ThenInclude(x => x.GameNavigation).
                                     ThenInclude(x => x.LocalNavigation)
                                     .Include(c => c.IdUserNavigation)
                                     .ToListAsync();
            var res = _mapper.Map<IEnumerable<ForecastDTO>>(respo);
            var response = await Result<IEnumerable<ForecastDTO>>.SuccessAsync(res);
            if (response != null) return Ok(response); else return NotFound();
        }



        [HttpGet("last")]
        public async Task<ActionResult<ForecastDTO>> GetLast()
        {
            var ActualWeek = await _context.Weeks.FirstOrDefaultAsync(x => x.Status == 1 || x.Status == 2);
            if (ActualWeek!= null)
            {
                var user = User.FindFirst(x => x.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier").Value;
                var respo = await _context.Forecasts.Where(x => x.IdUser == user && x.IdWeek == ActualWeek.Id).
                                         Include(x => x.ForecastDetails).
                                         ThenInclude(x => x.GameNavigation).
                                         ThenInclude(x => x.VisitorNavigation).
                                         Include(x => x.ForecastDetails).
                                         ThenInclude(x => x.GameNavigation).
                                         ThenInclude(x => x.LocalNavigation).
                                         FirstOrDefaultAsync();
                var response = _mapper.Map<ForecastDTO>(respo);
                var retorno = await Result<ForecastDTO>.SuccessAsync(response);
                if (response != null) return Ok(retorno); else return NotFound();
            }
            return NotFound();
        }

        [HttpPost]
        public async Task<Shared.Wrapper.IResult> Post(ForecastDTO forecast)
        {
            var user = User.FindFirst(x => x.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier").Value;
            forecast.IdUser = user;
            try
            {
                var data = _mapper.Map<Forecast>(forecast);
                await _context.Forecasts.AddAsync(data);
                await _context.SaveChangesAsync();
                var spools = _context.Spools.Where(x => x.WeekId == forecast.IdWeek).ToList();
                var spool = spools.LastOrDefault();
                spool.Participants = _context.Forecasts.Where(x => x.IdWeek == forecast.IdWeek).Count();
                spool.Amount =spool.Participants * 50;
                _context.Spools.Update(spool);
                await _context.SaveChangesAsync();
                await hubcontex.Clients.All.SendAsync("UpdateData");
                return await Result.SuccessAsync();
            }
            catch (System.Exception)
            {
                return await Result.FailAsync();
            }
        }


        [HttpPut]
        public async Task<Shared.Wrapper.IResult> Put(ForecastDTO forecast)
        {
            try
            {
                var data = _mapper.Map<Forecast>(forecast);
                foreach (var item in data.ForecastDetails)
                {
                    item.ForecastId = forecast.Idforecast;
                    item.GameNavigation = null;
                    item.WinNavigation = null;
                }
                _context.Forecasts.Update(data);
                await _context.SaveChangesAsync();
                await hubcontex.Clients.All.SendAsync("UpdateData");
                return await Result.SuccessAsync();
            }
            catch (System.Exception)
            {
                return await Result.FailAsync();
            }
        }
    }
}
