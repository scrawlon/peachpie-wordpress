FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine AS base

COPY . /peachpie-wordpress/

RUN dotnet restore /peachpie-wordpress/peachpie-wordpress.sln

FROM base AS build

WORKDIR /peachpie-wordpress/app

ENTRYPOINT dotnet watch run  --no-restore