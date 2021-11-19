#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["NFL/Server/NFL.Server.csproj", "NFL/Server/"]
COPY ["NFL/Shared/NFL.Shared.csproj", "NFL/Shared/"]
COPY ["NFL/Client/NFL.Client.csproj", "NFL/Client/"]
RUN dotnet restore "NFL/Server/NFL.Server.csproj"
COPY . .
WORKDIR "/src/NFL/Server"
RUN dotnet build "NFL.Server.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "NFL.Server.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "NFL.Server.dll"]