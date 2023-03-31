
FROM node:10

WORKDIR /app

COPY ./app/package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["node", "index.js"]
