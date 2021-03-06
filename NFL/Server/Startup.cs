using AutoMapper;
using IdentityServer4.Services;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authentication.OpenIdConnect;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpOverrides;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.ResponseCompression;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using NFL.Server.Data;
using NFL.Server.Models;
using NFL.Server.Services;
using System;
using System.Linq;
using System.Text;

namespace NFL.Server
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;

        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        // For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=398940
        public void ConfigureServices(IServiceCollection services)
        {
            Environment.SetEnvironmentVariable("NFL_TOKEN","");
            string connection = "";
            if(Environment.GetEnvironmentVariable("CONNECTION_STRING") == null)
            {
                connection = Configuration.GetConnectionString("TecConnection");
            }
            else
            {
                connection = Environment.GetEnvironmentVariable("CONNECTION_STRING");
            }

            Console.WriteLine(Environment.GetEnvironmentVariable("CONNECTION_STRING"));

            services.AddHttpClient("NFL.ServerAPI", client => client.BaseAddress = new Uri(""));

            //services.AddHostedService<ScoresService>();

            services.AddCors(options => options.AddPolicy("CorsPolicy", builder =>
            { builder.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader(); }));

            services.AddDbContext<ApplicationDbContext>(options =>
                options.UseMySql(connection
                   /* Configuration.GetConnectionString("DefaultConnection")*/, new MySqlServerVersion(new System.Version(8, 0, 26))));

            services.AddDbContext<apiContext>(options =>
                 options.UseMySql(connection
                    /* Configuration.GetConnectionString("DefaultConnection")*/, new MySqlServerVersion(new System.Version(8, 0, 26))));

            services.AddDatabaseDeveloperPageExceptionFilter();

            services.AddDefaultIdentity<ApplicationUser>(options =>
                                                        {
                                                            options.SignIn.RequireConfirmedAccount = false;
                                                            options.SignIn.RequireConfirmedEmail = false;
                                                            options.SignIn.RequireConfirmedPhoneNumber = false;
                                                            options.Password.RequireNonAlphanumeric = false;
                                                            options.Password.RequireDigit = false;
                                                            options.Password.RequireLowercase = false;
                                                            options.Password.RequireUppercase = false;
                                                        }
                        )
                .AddRoles<IdentityRole>()
                .AddDefaultTokenProviders()
                .AddEntityFrameworkStores<ApplicationDbContext>();

            services.AddIdentityServer( )
                .AddApiAuthorization<ApplicationUser, ApplicationDbContext>();

            services.AddScoped<IProfileService, ProfileService>();

            services.AddAuthentication().AddIdentityServerJwt();

            services.AddResponseCompression(o =>
            {
                o.MimeTypes = ResponseCompressionDefaults.MimeTypes.Concat(new[] { "application/octet-stream" });
            });


            var mapperConfig = new MapperConfiguration(n =>
            {
                n.AddProfile(new MapperConfig());
            });
            IMapper mapper = mapperConfig.CreateMapper();
            services.AddSignalR();
            services.AddSingleton(mapper);
            services.AddControllersWithViews();
            services.AddRazorPages();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseResponseCompression();
            
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseMigrationsEndPoint();
                app.UseWebAssemblyDebugging();
            }
            else
            {
                app.UseExceptionHandler("/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.Use(async (ctx, next) =>
            {
                ctx.Request.Scheme = "https";
                await next();
            });

            app.UseHttpsRedirection();
            app.UseBlazorFrameworkFiles();
            app.UseStaticFiles();
            app.UseCookiePolicy(new CookiePolicyOptions { MinimumSameSitePolicy = Microsoft.AspNetCore.Http.SameSiteMode.Lax });
            app.UseCors("CorsPolicy");
            app.UseRouting();

            app.UseForwardedHeaders(new ForwardedHeadersOptions
            {
                ForwardedHeaders = ForwardedHeaders.XForwardedFor | ForwardedHeaders.XForwardedProto
            });

            app.UseIdentityServer();
            app.UseAuthentication();
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapRazorPages();
                endpoints.MapHub<HubService>("/hub/hubregister");
                endpoints.MapControllers();
                endpoints.MapFallbackToFile("index.html");
            });
        }
    }
}
