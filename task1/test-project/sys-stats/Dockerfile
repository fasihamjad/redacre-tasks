FROM node:14


WORKDIR /app


COPY package.json yarn.lock* ./


RUN yarn install
RUN yarn


COPY . .


RUN yarn build


EXPOSE 3000


CMD ["yarn", "start"]
