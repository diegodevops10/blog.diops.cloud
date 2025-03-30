FROM hugomods/hugo:ci-0.145.0 AS build
WORKDIR /src

COPY . /src

RUN hugo --minify && ls -la public

FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/* && ls -la /usr/share/nginx/html/
COPY --from=build /src/public /usr/share/nginx/html
RUN ls -la /usr/share/nginx/html

EXPOSE 80
