FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine AS base

COPY ./peachpie-wordpress.sln /peachpie-wordpress/
COPY ./Directory.Build.props /peachpie-wordpress/
COPY ./global.json /peachpie-wordpress/
COPY ./app/app.csproj /peachpie-wordpress/app/
COPY ./MyContent/MyContent.msbuildproj /peachpie-wordpress/MyContent/

RUN dotnet restore /peachpie-wordpress/app/app.csproj

FROM base AS build

WORKDIR /peachpie-wordpress/app

ENTRYPOINT dotnet watch run  --no-restore