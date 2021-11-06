# Miljøhack 2021 Posten
Build status: ![Build status:](https://github.com/brynjen/miljohack2021/actions/workflows/dart.yml/badge.svg)

# Premise
We are optimizing the last mile for mail delivery to conserve how many transports are shipped out,
considerably lowering Co2 cost of the extra transports - using customer good will to accept that
the packages arrive at a later time with a point system and bonus arrangements.

Team: ![Team Awesome](team-awesome.png "Team awesome")


This github is a Flutter project for Miljøhack 2021.

## Quick walkThrough of project
- Access our kanban flow [here](https://github.com/brynjen/miljohack2021/projects/1)
- Front end is Flutter app for iOS and Android
- Backend ML model made in Python
- Backend rest api and logic in Python

## Architecture schema
Architecture plan [here](MiljohackArchitecture.drawio)

## Business plan
To see more of how our business plan is look [here](business-plan.png)

## User onboarding
Quick screen for onboarding [here](bruker-onboarding.png)

## Burndown chart
Burndown chart can be found [here](burndown.png)

## Risk analysis
To look deeper into our risk analysis check out our [Risk assessment](forretningsrisk.png)

## Branding
We created a branding suggestion that you can see [here](branding.png)

## Easter
We added a little easter egg for the not-so friendly souls that reject the [environment](easteregg.png)

## Icon update
To update icon, upload [config file](assets/icons/config.json) to [FlutterIcons](https://www.fluttericons.com),
add your desired icons and download file. Step by step:
1. Unzip, rename MiljoHack.tff to miljo_hack.tff, move it [here](assets/icons/) and replace the 
   existing one.
2. Move the config.json to [here](assets/icons/)
3. Move the miljo_hack_icons.dart [here](presentation/core/icons/) and overwrite existing file