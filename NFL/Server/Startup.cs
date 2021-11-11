using AutoMapper;
using IdentityServer4.Services;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
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
            string connection = "";
            if(Environment.GetEnvironmentVariable("CONNECTION_STRING") == null)
            {
                connection = Configuration.GetConnectionString("DefaultConnection");
            }
            else
            {
                connection = Environment.GetEnvironmentVariable("CONNECTION_STRING");
            }
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
                                                            options.SignIn.RequireConfirmedAccount = true;
                                                            options.Password.RequireNonAlphanumeric = false;
                                                            options.Password.RequireDigit = false;
                                                            options.Password.RequireLowercase = false;
                                                            options.Password.RequireUppercase = false;
                                                        }
                        )
                .AddRoles<IdentityRole>()
                .AddEntityFrameworkStores<ApplicationDbContext>();

            services.AddIdentityServer( )
                .AddApiAuthorization<ApplicationUser, ApplicationDbContext>();

            services.AddScoped<IProfileService, ProfileService>();

            services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
                .AddJwtBearer(options =>
                options.TokenValidationParameters = new Microsoft.IdentityModel.Tokens.TokenValidationParameters
                {
                        ValidateIssuer = false,
                        ValidateAudience = false,
                        ValidateLifetime = true,
                        ValidateIssuerSigningKey = true,
                        IssuerSigningKey = new SymmetricSecurityKey(
                        Encoding.UTF8.GetBytes(Configuration["jwt:key"])),
                        ClockSkew = TimeSpan.Zero
                })
                .AddIdentityServerJwt();

            var mapperConfig = new MapperConfiguration(n =>
            {
                n.AddProfile(new MapperConfig());
            });
            IMapper mapper = mapperConfig.CreateMapper();
            services.AddSingleton(mapper);
            services.AddControllersWithViews();
            services.AddRazorPages();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
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

            app.UseHttpsRedirection();
            app.UseBlazorFrameworkFiles();
            app.UseStaticFiles();
            app.UseCors("CorsPolicy");
            app.UseRouting();

            app.UseIdentityServer();
            app.UseAuthentication();
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapRazorPages();
                endpoints.MapControllers();
                endpoints.MapFallbackToFile("index.html");
            });
        }
    }
}