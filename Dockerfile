FROM node:9-alpine

RUN mkdir -p /usr/srv/app
WORKDIR /usr/srv/app

ADD package.json ./package.json
RUN npm install --silent

ADD src ./src

CMD ["node", "src/index.js"]
