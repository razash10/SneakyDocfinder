FROM node:latest

ARG service_src

WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install

COPY ${service_src} ./service/src
COPY ./src/common ./service/common

CMD [ "npm", "run", "start" ]