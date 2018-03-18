FROM node:9-alpine

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ADD package.json ./package.json
RUN npm install --silent

ADD src ./src

CMD ["node", "src/index.js"]
