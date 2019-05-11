FROM node:10-alpine as build
WORKDIR /usr/app/out
COPY package.json .
RUN npm install && npm cache clean --force
COPY . .
RUN npm run build

FROM nginx:1.15-alpine
COPY --from=build /usr/app/out/build /usr/share/nginx/html