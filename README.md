[![Build Status](https://travis-ci.org/bpruitt-goddard/gametrackerv2.svg?branch=master)](https://travis-ci.org/bpruitt-goddard/gametrackerv2)
![Deploy Status](https://heroku-badges.herokuapp.com/?app=boardgame-tracker)

# README

An application for tracking board game plays and displaying past results in various statistics (win rates, streakes, best player for game, etc).

## Build/Install

1. Build the docker images `docker-compose build`
1. Create a local docker volume for the database using `docker volume create --name data -d local`. This will allow the database data to persist across docker runs. 
1. Boot the app using `docker-compose up`
1. With the app running from (3), create the database with `docker-compose run web rake db:create`, then run any pending database migrations with `docker-compose run web rake db:migrate`.

## Run Tests

1. Boot the app using the steps in [bulid/install](#buildinstall)
1. Open another command prompt and run `docker-compose run web rails test`

## Debug

1. Boot the app using the steps in [bulid/install](#buildinstall)
1. Break the code anywhere by adding the statement `byebug` using the debugger of the same name.
1. Determine the running container's id by running `docker ps`. This will show an id like `063170216bb5` for the web container.
1. Open another command prompt and attach to the above container using `docker attach <container id>`.
1. Interact with the app to get to the point being debugged and the above command prompt will break execution.

## Query Database

The database is managed via a dedicated Postgresql docker container, with the data stored locally in a docker volume. Run these steps to get a `psql` prompt. **Note** The steps are for connecting to the development environment.:

1. Determine the running docker id for the database container using `docker ps`. This will show an id like `063170216bb5`.
1. Create a bash prompt to the database container via `docker exec -it <container id> bash`
1. Open a psql prompt using `psql -U postgres`.
1. Connect to the dev databes using `\c myapp_development`.
1. Run any query you want, such as `select * from games;`.
