FROM node:lts AS build
WORKDIR ./casais-sampieri/
COPY ./casais-sampieri/ .
RUN npm install
RUN npm run build

FROM nginx:alpine AS run
RUN rm ./usr/share/nginx/html/index.html
COPY --from=build ./casais-sampieri/.next/ ./usr/share/nginx/html/
COPY ./casais-sampieri/public/ ./usr/share/nginx/html/server/app/
RUN rm ./etc/nginx/conf.d/default.conf
COPY ./default.conf ./etc/nginx/conf.d/