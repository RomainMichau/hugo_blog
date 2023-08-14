FROM klakegg/hugo:0.107.0-ext-alpine as build
WORKDIR /webapp
COPY ./ .
ENTRYPOINT ["hugo", "server"]