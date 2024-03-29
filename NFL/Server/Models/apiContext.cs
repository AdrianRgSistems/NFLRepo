﻿using System;
using System.Collections.Generic;
using System.Configuration;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace NFL.Server.Models
{
    public partial class apiContext : DbContext
    {
        private readonly string _connectionString;
        public apiContext(string conecctionString)
        {
            _connectionString = conecctionString;
        }

        public apiContext(DbContextOptions<apiContext> options)
            : base(options)
        {
        }

        public virtual DbSet<AspNetRole> AspNetRoles { get; set; }
        public virtual DbSet<AspNetRoleClaim> AspNetRoleClaims { get; set; }
        public virtual DbSet<AspNetUser> AspNetUsers { get; set; }
        public virtual DbSet<AspNetUserClaim> AspNetUserClaims { get; set; }
        public virtual DbSet<AspNetUserLogin> AspNetUserLogins { get; set; }
        public virtual DbSet<AspNetUserToken> AspNetUserTokens { get; set; }
        public virtual DbSet<Conference> Conferences { get; set; }
        public virtual DbSet<DeviceCode> DeviceCodes { get; set; }
        public virtual DbSet<Division> Divisions { get; set; }
        public virtual DbSet<EfmigrationsHistory> EfmigrationsHistories { get; set; }
        public virtual DbSet<Forecast> Forecasts { get; set; }
        public virtual DbSet<ForecastDetail> ForecastDetails { get; set; }
        public virtual DbSet<Game> Games { get; set; }
        public virtual DbSet<PersistedGrant> PersistedGrants { get; set; }
        public virtual DbSet<Schedule> Schedules { get; set; }
        public virtual DbSet<Spool> Spools { get; set; }
        public virtual DbSet<SpoolWinner> SpoolWinners { get; set; }
        public virtual DbSet<Team> Teams { get; set; }
        public virtual DbSet<Week> Weeks { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseMySql(_connectionString, Microsoft.EntityFrameworkCore.ServerVersion.Parse("8.0.27-mysql"));
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.UseCollation("utf8mb4_0900_ai_ci")
                .HasCharSet("utf8mb4");

            modelBuilder.Entity<AspNetRole>(entity =>
            {
                entity.HasIndex(e => e.NormalizedName, "RoleNameIndex")
                    .IsUnique();

                entity.Property(e => e.Name).HasMaxLength(256);

                entity.Property(e => e.NormalizedName).HasMaxLength(256);
            });

            modelBuilder.Entity<AspNetRoleClaim>(entity =>
            {
                entity.HasIndex(e => e.RoleId, "IX_AspNetRoleClaims_RoleId");

                entity.Property(e => e.RoleId).IsRequired();

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.AspNetRoleClaims)
                    .HasForeignKey(d => d.RoleId);
            });

            modelBuilder.Entity<AspNetUser>(entity =>
            {
                entity.HasIndex(e => e.NormalizedEmail, "EmailIndex");

                entity.HasIndex(e => e.NormalizedUserName, "UserNameIndex")
                    .IsUnique();

                entity.Property(e => e.Email).HasMaxLength(256);

                entity.Property(e => e.Fullname).HasColumnName("fullname");

                entity.Property(e => e.LockoutEnd).HasMaxLength(6);

                entity.Property(e => e.NormalizedEmail).HasMaxLength(256);

                entity.Property(e => e.NormalizedUserName).HasMaxLength(256);

                entity.Property(e => e.UserName).HasMaxLength(256);

                entity.HasMany(d => d.Roles)
                    .WithMany(p => p.Users)
                    .UsingEntity<Dictionary<string, object>>(
                        "AspNetUserRole",
                        l => l.HasOne<AspNetRole>().WithMany().HasForeignKey("RoleId"),
                        r => r.HasOne<AspNetUser>().WithMany().HasForeignKey("UserId"),
                        j =>
                        {
                            j.HasKey("UserId", "RoleId").HasName("PRIMARY").HasAnnotation("MySql:IndexPrefixLength", new[] { 0, 0 });

                            j.ToTable("AspNetUserRoles");

                            j.HasIndex(new[] { "RoleId" }, "IX_AspNetUserRoles_RoleId");
                        });
            });

            modelBuilder.Entity<AspNetUserClaim>(entity =>
            {
                entity.HasIndex(e => e.UserId, "IX_AspNetUserClaims_UserId");

                entity.Property(e => e.UserId).IsRequired();

                entity.HasOne(d => d.User)
                    .WithMany(p => p.AspNetUserClaims)
                    .HasForeignKey(d => d.UserId);
            });

            modelBuilder.Entity<AspNetUserLogin>(entity =>
            {
                entity.HasKey(e => new { e.LoginProvider, e.ProviderKey })
                    .HasName("PRIMARY")
                    .HasAnnotation("MySql:IndexPrefixLength", new[] { 0, 0 });

                entity.HasIndex(e => e.UserId, "IX_AspNetUserLogins_UserId");

                entity.Property(e => e.LoginProvider).HasMaxLength(128);

                entity.Property(e => e.ProviderKey).HasMaxLength(128);

                entity.Property(e => e.UserId).IsRequired();

                entity.HasOne(d => d.User)
                    .WithMany(p => p.AspNetUserLogins)
                    .HasForeignKey(d => d.UserId);
            });

            modelBuilder.Entity<AspNetUserToken>(entity =>
            {
                entity.HasKey(e => new { e.UserId, e.LoginProvider, e.Name })
                    .HasName("PRIMARY")
                    .HasAnnotation("MySql:IndexPrefixLength", new[] { 0, 0, 0 });

                entity.Property(e => e.LoginProvider).HasMaxLength(128);

                entity.Property(e => e.Name).HasMaxLength(128);

                entity.HasOne(d => d.User)
                    .WithMany(p => p.AspNetUserTokens)
                    .HasForeignKey(d => d.UserId);
            });

            modelBuilder.Entity<Conference>(entity =>
            {
                entity.ToTable("conference");

                entity.HasIndex(e => e.Id, "id_UNIQUE")
                    .IsUnique();

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Alias)
                    .HasMaxLength(3)
                    .HasColumnName("alias");

                entity.Property(e => e.Conference1)
                    .HasMaxLength(75)
                    .HasColumnName("conference");

                entity.Property(e => e.ConferenceShort)
                    .HasMaxLength(25)
                    .HasColumnName("conference_short");
            });

            modelBuilder.Entity<DeviceCode>(entity =>
            {
                entity.HasKey(e => e.UserCode)
                    .HasName("PRIMARY");

                entity.HasIndex(e => e.DeviceCode1, "IX_DeviceCodes_DeviceCode")
                    .IsUnique();

                entity.HasIndex(e => e.Expiration, "IX_DeviceCodes_Expiration");

                entity.Property(e => e.UserCode).HasMaxLength(200);

                entity.Property(e => e.ClientId)
                    .IsRequired()
                    .HasMaxLength(200);

                entity.Property(e => e.CreationTime).HasMaxLength(6);

                entity.Property(e => e.Data).IsRequired();

                entity.Property(e => e.Description).HasMaxLength(200);

                entity.Property(e => e.DeviceCode1)
                    .IsRequired()
                    .HasMaxLength(200)
                    .HasColumnName("DeviceCode");

                entity.Property(e => e.Expiration).HasMaxLength(6);

                entity.Property(e => e.SessionId).HasMaxLength(100);

                entity.Property(e => e.SubjectId).HasMaxLength(200);
            });

            modelBuilder.Entity<Division>(entity =>
            {
                entity.ToTable("divisions");

                entity.HasIndex(e => e.IdConference, "fk_conference_idx");

                entity.HasIndex(e => e.Id, "id_UNIQUE")
                    .IsUnique();

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.DivisionsName)
                    .HasMaxLength(45)
                    .HasColumnName("divisions_name");

                entity.Property(e => e.IdConference).HasColumnName("id_conference");

                entity.HasOne(d => d.IdConferenceNavigation)
                    .WithMany(p => p.Divisions)
                    .HasForeignKey(d => d.IdConference)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("fk_conference");
            });

            modelBuilder.Entity<EfmigrationsHistory>(entity =>
            {
                entity.HasKey(e => e.MigrationId)
                    .HasName("PRIMARY");

                entity.ToTable("__EFMigrationsHistory");

                entity.Property(e => e.MigrationId).HasMaxLength(150);

                entity.Property(e => e.ProductVersion)
                    .IsRequired()
                    .HasMaxLength(32);
            });

            modelBuilder.Entity<Forecast>(entity =>
            {
                entity.HasKey(e => e.Idforecast)
                    .HasName("PRIMARY");

                entity.ToTable("forecast");

                entity.HasIndex(e => e.IdUser, "fk_user_idx");

                entity.HasIndex(e => e.IdWeek, "fk_week_idx");

                entity.Property(e => e.Idforecast).HasColumnName("idforecast");

                entity.Property(e => e.Hits).HasColumnName("hits");

                entity.Property(e => e.IdUser)
                    .IsRequired()
                    .HasColumnName("idUser");

                entity.Property(e => e.IdWeek).HasColumnName("idWeek");

                entity.Property(e => e.Tiebreaker).HasColumnName("tiebreaker");

                entity.HasOne(d => d.IdUserNavigation)
                    .WithMany(p => p.Forecasts)
                    .HasForeignKey(d => d.IdUser)
                    .HasConstraintName("fk_user");

                entity.HasOne(d => d.IdWeekNavigation)
                    .WithMany(p => p.Forecasts)
                    .HasForeignKey(d => d.IdWeek)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("fk_week_spool");
            });

            modelBuilder.Entity<ForecastDetail>(entity =>
            {
                entity.ToTable("forecast_detail");

                entity.HasIndex(e => e.ForecastId, "fk-forecast_idx");

                entity.HasIndex(e => e.Game, "fk_game-_idx");

                entity.HasIndex(e => e.Win, "fk_win_idx");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.ForecastId)
                    .HasColumnName("forecast_id")
                    .HasComment("lla ve foranea de pronostico");

                entity.Property(e => e.Game)
                    .HasColumnName("game")
                    .HasComment("identificador de juego");

                entity.Property(e => e.IsCorrect)
                    .HasColumnName("is_correct")
                    .HasDefaultValueSql("'0'")
                    .HasComment("define si el pronostico fue correcto");

                entity.Property(e => e.Set)
                    .HasColumnName("set")
                    .HasDefaultValueSql("'0'")
                    .HasComment("establece si la prediccion se completo");

                entity.Property(e => e.Win)
                    .HasMaxLength(4)
                    .HasColumnName("win")
                    .HasComment("id del equipo ganador");

                entity.HasOne(d => d.Forecast)
                    .WithMany(p => p.ForecastDetails)
                    .HasForeignKey(d => d.ForecastId)
                    .HasConstraintName("fk-forecast");

                entity.HasOne(d => d.GameNavigation)
                    .WithMany(p => p.ForecastDetails)
                    .HasForeignKey(d => d.Game)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("fk_game-");

                entity.HasOne(d => d.WinNavigation)
                    .WithMany(p => p.ForecastDetails)
                    .HasPrincipalKey(p => p.Alias)
                    .HasForeignKey(d => d.Win)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("fk_win");
            });

            modelBuilder.Entity<Game>(entity =>
            {
                entity.ToTable("games");

                entity.HasIndex(e => e.Local, "fk_local_idx");

                entity.HasIndex(e => e.Visitor, "fk_visitor_idx");

                entity.HasIndex(e => e.WeekId, "fk_week_idx");

                entity.HasIndex(e => e.Win, "fkwin_idx");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Date).HasColumnName("date");

                entity.Property(e => e.Local)
                    .HasMaxLength(4)
                    .HasColumnName("local");

                entity.Property(e => e.LocalScore).HasColumnName("local_score");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.Property(e => e.Visitor)
                    .HasMaxLength(4)
                    .HasColumnName("visitor");

                entity.Property(e => e.VisitorScore).HasColumnName("visitor_score");

                entity.Property(e => e.WeekId).HasColumnName("week_id");

                entity.Property(e => e.Win)
                    .HasMaxLength(4)
                    .HasColumnName("win");

                entity.HasOne(d => d.LocalNavigation)
                    .WithMany(p => p.GameLocalNavigations)
                    .HasPrincipalKey(p => p.Alias)
                    .HasForeignKey(d => d.Local)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("fk_local");

                entity.HasOne(d => d.VisitorNavigation)
                    .WithMany(p => p.GameVisitorNavigations)
                    .HasPrincipalKey(p => p.Alias)
                    .HasForeignKey(d => d.Visitor)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("fk_visitor");

                entity.HasOne(d => d.Week)
                    .WithMany(p => p.Games)
                    .HasForeignKey(d => d.WeekId)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("fk_week");

                entity.HasOne(d => d.WinNavigation)
                    .WithMany(p => p.GameWinNavigations)
                    .HasPrincipalKey(p => p.Alias)
                    .HasForeignKey(d => d.Win)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("fkwin");
            });

            modelBuilder.Entity<PersistedGrant>(entity =>
            {
                entity.HasKey(e => e.Key)
                    .HasName("PRIMARY");

                entity.HasIndex(e => e.Expiration, "IX_PersistedGrants_Expiration");

                entity.HasIndex(e => new { e.SubjectId, e.ClientId, e.Type }, "IX_PersistedGrants_SubjectId_ClientId_Type");

                entity.HasIndex(e => new { e.SubjectId, e.SessionId, e.Type }, "IX_PersistedGrants_SubjectId_SessionId_Type");

                entity.Property(e => e.Key).HasMaxLength(200);

                entity.Property(e => e.ClientId)
                    .IsRequired()
                    .HasMaxLength(200);

                entity.Property(e => e.ConsumedTime).HasMaxLength(6);

                entity.Property(e => e.CreationTime).HasMaxLength(6);

                entity.Property(e => e.Data).IsRequired();

                entity.Property(e => e.Description).HasMaxLength(200);

                entity.Property(e => e.Expiration).HasMaxLength(6);

                entity.Property(e => e.SessionId).HasMaxLength(100);

                entity.Property(e => e.SubjectId).HasMaxLength(200);

                entity.Property(e => e.Type)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Schedule>(entity =>
            {
                entity.ToTable("schedule");

                entity.HasIndex(e => e.Year, "year_UNIQUE")
                    .IsUnique();

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Year).HasColumnName("year");
            });

            modelBuilder.Entity<Spool>(entity =>
            {
                entity.HasKey(e => e.Idspool)
                    .HasName("PRIMARY");

                entity.ToTable("spool");

                entity.HasIndex(e => e.Idspool, "idspool_UNIQUE")
                    .IsUnique();

                entity.HasIndex(e => e.WeekId, "weekfore_idx");

                entity.Property(e => e.Idspool).HasColumnName("idspool");

                entity.Property(e => e.Amount)
                    .HasPrecision(10, 2)
                    .HasColumnName("amount");

                entity.Property(e => e.Participants).HasColumnName("participants");

                entity.Property(e => e.WeekId).HasColumnName("week_id");

                entity.Property(e => e.Winners).HasColumnName("winners");

                entity.HasOne(d => d.Week)
                    .WithMany(p => p.Spools)
                    .HasForeignKey(d => d.WeekId)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("weekfore");
            });

            modelBuilder.Entity<SpoolWinner>(entity =>
            {
                entity.HasKey(e => e.IdspoolWinners)
                    .HasName("PRIMARY");

                entity.ToTable("spool_winners");

                entity.HasIndex(e => e.IdForecast, "fkforecast_idx");

                entity.HasIndex(e => e.SpoolId, "fkspool_idx");

                entity.HasIndex(e => e.IdUser, "fkuser_idx");

                entity.HasIndex(e => e.IdspoolWinners, "idspool_winners_UNIQUE")
                    .IsUnique();

                entity.Property(e => e.IdspoolWinners).HasColumnName("idspool_winners");

                entity.Property(e => e.Amount)
                    .HasPrecision(10, 2)
                    .HasColumnName("amount");

                entity.Property(e => e.IdForecast).HasColumnName("id_forecast");

                entity.Property(e => e.IdUser)
                    .IsRequired()
                    .HasColumnName("id_User");

                entity.Property(e => e.SpoolId).HasColumnName("spool_id");

                entity.HasOne(d => d.IdForecastNavigation)
                    .WithMany(p => p.SpoolWinners)
                    .HasForeignKey(d => d.IdForecast)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("fkforecast");

                entity.HasOne(d => d.IdUserNavigation)
                    .WithMany(p => p.SpoolWinners)
                    .HasForeignKey(d => d.IdUser)
                    .HasConstraintName("fkuser");

                entity.HasOne(d => d.Spool)
                    .WithMany(p => p.SpoolWinners)
                    .HasForeignKey(d => d.SpoolId)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("fkspool");
            });

            modelBuilder.Entity<Team>(entity =>
            {
                entity.HasKey(e => e.IdTeam)
                    .HasName("PRIMARY");

                entity.ToTable("teams");

                entity.HasIndex(e => e.DivisionId, "fk_division_idx");

                entity.HasIndex(e => e.IdTeam, "id_team_UNIQUE")
                    .IsUnique();

                entity.HasIndex(e => e.LastName, "last_name_UNIQUE")
                    .IsUnique();

                entity.HasIndex(e => e.Alias, "mote_index")
                    .IsUnique();

                entity.Property(e => e.IdTeam).HasColumnName("id_team");

                entity.Property(e => e.Alias)
                    .IsRequired()
                    .HasMaxLength(4)
                    .HasColumnName("alias");

                entity.Property(e => e.DivisionId).HasColumnName("division_id");

                entity.Property(e => e.ImageUrl)
                    .HasMaxLength(200)
                    .HasColumnName("image_url");

                entity.Property(e => e.LastName)
                    .HasMaxLength(50)
                    .HasColumnName("last_name");

                entity.Property(e => e.TeamName)
                    .HasMaxLength(100)
                    .HasColumnName("team_name");

                entity.HasOne(d => d.Division)
                    .WithMany(p => p.Teams)
                    .HasForeignKey(d => d.DivisionId)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("fk_division");
            });

            modelBuilder.Entity<Week>(entity =>
            {
                entity.ToTable("weeks");

                entity.HasIndex(e => e.ScheduleId, "fk_schedule_idx");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.LastScore).HasColumnName("last_score");

                entity.Property(e => e.ScheduleId).HasColumnName("schedule_id");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.Property(e => e.WeekName)
                    .HasMaxLength(45)
                    .HasColumnName("week_name");

                entity.Property(e => e.WeekNumber).HasColumnName("week_number");

                entity.HasOne(d => d.Schedule)
                    .WithMany(p => p.Weeks)
                    .HasForeignKey(d => d.ScheduleId)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("fk_schedule");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
