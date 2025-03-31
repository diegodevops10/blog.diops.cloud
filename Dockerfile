FROM hugomods/hugo:ci-0.145.0 AS build
WORKDIR /opt

COPY . .
RUN hugo --minify

FROM nginx:alpine
# RUN rm -rf /usr/share/nginx/html/* && ls -la /usr/share/nginx/html/
WORKDIR /usr/share/nginx/html
COPY --from=build /opt/public .
RUN ls -la /usr/share/nginx/html

EXPOSE 80
