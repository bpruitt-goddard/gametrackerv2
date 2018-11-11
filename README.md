# README

An application for tracking board game plays and displaying past results in various statistics (win rates, streakes, best player for game, etc).

## Build/Install

1. Build the docker images `docker-compose build`
1. Boot the app using `docker-compose up`
1. With the app running from (2), create the databes with `docker-compose run web rake db:create`, then run any pending database migrations with `docker-compose run web rake db:migrate`.