FROM hugomods/hugo:ci-0.145.0 AS build
WORKDIR /opt

COPY . .

RUN hugo --minify && chmod -R 777 public/

FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/* && ls -la /usr/share/nginx/html/
COPY --from=build /opt/public /usr/share/nginx/html
RUN ls -la /usr/share/nginx/html

EXPOSE 80
