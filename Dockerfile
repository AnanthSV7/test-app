
FROM node:10

WORKDIR /app

COPY index.js ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["node", "index.js"]
