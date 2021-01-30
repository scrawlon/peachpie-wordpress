FROM mcr.microsoft.com/dotnet/sdk:5.0-focal as build

COPY . /peachpie-wordpress

WORKDIR /peachpie-wordpress/app

ENTRYPOINT dotnet restore && dotnet watch run