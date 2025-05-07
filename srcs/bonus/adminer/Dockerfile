FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y apache2 php php-mysqli wget
RUN rm -rf /var/lib/apt/lists/*

RUN wget https://www.adminer.org/latest.php -O /var/www/html/adminer.php
RUN echo 'ServerName localhost' >> /etc/apache2/apache2.conf
EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]