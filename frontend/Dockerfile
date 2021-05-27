# pull official base image
FROM node:13.12.0-alpine

# set working directory
WORKDIR /app/frontend

# install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install

# start app
CMD ["npm", "start"]