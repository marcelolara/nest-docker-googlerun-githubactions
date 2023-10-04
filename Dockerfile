FROM node:18-alpine

WORKDIR /app

COPY package.json yarn*.lock ./

RUN yarn install --frozen-lockfile

COPY . .

RUN yarn build & yarn prisma generate

EXPOSE 8080

ENV NODE_OPTIONS=--max_old_space_size=2048

CMD ["yarn", "start"]