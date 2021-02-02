FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine AS build

WORKDIR /peachpie-wordpress/app

ENTRYPOINT dotnet restore && dotnet watch run  --no-restore