FROM node:14 as base

WORKDIR /home/node/app

COPY package.json ./

RUN npm i
RUN npm i typescript -g
RUN npm i -g @nestjs/cli
RUN apt update && apt upgrade -y
RUN apt install -y postgresql postgresql-contrib

COPY . .

FROM base as production

ENV NODE_PATH=./build

RUN npm run build
WORKDIR /home/node/app/src/mytestapps