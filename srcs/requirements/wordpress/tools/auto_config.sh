#!/bin/bash

mkdir -p /var/www/html/wordpress
mv /var/www/html/wp-config.php /var/www/html/wordpress/wp-config.php

sleep 10

if [ ! -f /var/www/html/wordpress/wp-config-sample.php ]; then
    echo "Downloading WordPress..."
    wp core download --allow-root --path=/var/www/html/wordpress
fi

if ! wp core is-installed --allow-root --path=/var/www/html/wordpress; then
    echo "Configuring WordPress..."

    wp core install --allow-root \
                    --path=/var/www/html/wordpress \
                    --url=https://$DOMAIN_NAME \
                    --title=$SITE_TITLE \
                    --admin_user=$ADMIN_USER \
                    --admin_password=$ADMIN_PASSWORD \
                    --admin_email=$ADMIN_EMAIL

    if ! wp user get $USER1_LOGIN --allow-root --path=/var/www/html/wordpress < /dev/null 2>&1; then
        wp user create $USER1_LOGIN $USER1_MAIL \
                    --allow-root \
                    --path=/var/www/html/wordpress \
                    --role=author \
                    --user_pass=$USER1_PASS
    fi
    wp cache flush --allow-root --path=/var/www/html/wordpress
    wp language core install en_US --activate --allow-root --path=/var/www/html/wordpress
    wp plugin delete hello --allow-root --path=/var/www/html/wordpress
    wp rewrite structure '/%postname%/' --allow-root --path=/var/www/html/wordpress
fi

chown -R www-data:www-data /var/www/html/wordpress
chmod -R 755 /var/www/html/wordpress

if [ ! -d "/run/php" ]; then
    mkdir -p /run/php
fi

chown -R www-data:www-data /run/php
chmod -R 755 /run/php

exec /usr/sbin/php-fpm7.4 -F -R