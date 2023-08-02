FROM klakegg/hugo:0.107.0-ext-alpine as build
ARG HUGO_FLAGS=""
WORKDIR /webapp
COPY ./ .
RUN hugo ${DRAFT_PARAM}


FROM nginx
COPY --from=build /webapp/public /usr/share/nginx/html