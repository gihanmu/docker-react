
# build phase
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# run phase - when you put another from clause the first one is termintated

FROM nginx

COPY --from=builder /app/build  /usr/share/nginx/html