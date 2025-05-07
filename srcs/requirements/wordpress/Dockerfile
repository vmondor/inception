FROM debian:bullseye
RUN apt update -y && apt upgrade -y
RUN apt install -y wget
RUN apt install -y php7.4 
RUN apt-get install -y php-fpm 
RUN apt-get install -y php-mysql

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN apt-get update && apt-get install -y default-mysql-client
RUN apt-get install -y mariadb-client

RUN wget https://wordpress.org/wordpress-6.6.tar.gz -P /var/www/html
RUN cd /var/www/html && tar -xzf /var/www/html/wordpress-6.6.tar.gz && rm /var/www/html/wordpress-6.6.tar.gz

RUN chown -R www-data:www-data /var/www/*
RUN chmod -R 755 /var/www/*

EXPOSE 9000

COPY ./tools/wp-config.php /var/www/html/wp-config.php
COPY ./tools/auto_config.sh ./
RUN chmod +x ./auto_config.sh
COPY ./tools/www.conf /etc/php/7.4/fpm/pool.d/www.conf
ENTRYPOINT ["bash", "./auto_config.sh"]