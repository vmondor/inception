FROM debian:bullseye
RUN apt update -y && apt upgrade -y
RUN apt install -y nginx
RUN apt install -y vim && apt install -y curl
RUN mkdir -p /etc/nginx/ssl
RUN apt install -y openssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=vmondor.42.fr/UID=vmondor"
RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html
ENTRYPOINT ["nginx", "-g", "daemon off;"]