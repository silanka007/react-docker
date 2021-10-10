FROM node:14.18-alpine3.12
RUN addgroup app && adduser -S -G app app
USER app
WORKDIR /app
COPY package*.json .
RUN npm install
RUN npm audit fix
COPY . .
ENV dev=silanka
EXPOSE 3000
CMD [ "npm", "start" ]
