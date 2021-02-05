FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine AS base

COPY ./*.sln /peachpie-wordpress/
COPY ./*.json /peachpie-wordpress/
COPY ./*.props /peachpie-wordpress/
COPY ./app/*.json /peachpie-wordpress/app/
COPY ./app/*.csproj /peachpie-wordpress/app/
COPY ./MyContent/*.msbuildproj /peachpie-wordpress/MyContent/

WORKDIR /peachpie-wordpress

RUN dotnet restore peachpie-wordpress.sln --disable-parallel

FROM base AS build

WORKDIR /peachpie-wordpress/app

ENTRYPOINT dotnet watch run 