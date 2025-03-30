FROM hugomods/hugo:ci-0.145.0 AS build
WORKDIR /src

COPY . /src

RUN hugo --minify

FROM nginx:alpine
COPY --from=build /src/public /usr/share/nginx/html

EXPOSE 80
