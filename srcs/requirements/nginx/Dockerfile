FROM alpine:3.15

EXPOSE 80

RUN apk add --no-cache openssl curl ca-certificates nginx

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]