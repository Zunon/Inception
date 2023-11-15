FROM alpine:3.18
RUN apk add --no-cache nginx openssl
RUN mkdir -p /run/nginx
RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=AE/ST=Abu Dhabi/L=Khalifa University/O=ECCE Department College of Engineering/CN=www.zunon.io"
CMD ["nginx", "-g", "daemon off;"]
EXPOSE 443:443