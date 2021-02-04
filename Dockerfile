FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine AS base

COPY . /peachpie-wordpress/

WORKDIR /peachpie-wordpress/app

RUN dotnet restore

FROM base AS build

ENTRYPOINT dotnet restore && dotnet watch run  --no-restore