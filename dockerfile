FROM node:lts AS build
WORKDIR ./casais-sampieri/
COPY ./casais-sampieri/ .
RUN npm install
RUN npm run build

FROM nginx:alpine AS run
COPY --from=build ./casais-sampieri/_next/ /_next/
COPY ./casais-sampieri/public/ /_next/server/app/
COPY ./default.conf ./etc/nginx/conf.d/
