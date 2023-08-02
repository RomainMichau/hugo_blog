FROM klakegg/hugo:0.107.0-ext-alpine as build
WORKDIR /webapp
COPY ./ .
RUN hugo


FROM nginx
COPY --from=build /webapp/public /usr/share/nginx/html