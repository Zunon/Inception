#!/bin/sh
set -e
until mysqladmin ping -h"$WORDPRESS_DB_HOST" -u"$WORDPRESS_DB_USER" -p"$WORDPRESS_DB_PASSWORD" --silent;
do
  echo 'Waiting for the database server to be available...'
  sleep 1
done
echo 'Database server is up and running!'
if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
    cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
    sed -i "s/database_name_here/$WORDPRESS_DB_NAME/" /var/www/wordpress/wp-config.php
    sed -i "s/username_here/$WORDPRESS_DB_USER/" /var/www/wordpress/wp-config.php
    sed -i "s/password_here/$WORDPRESS_DB_PASSWORD/" /var/www/wordpress/wp-config.php
    sed -i "s/localhost/$WORDPRESS_DB_HOST/" /var/www/wordpress/wp-config.php
fi

sh /usr/local/bin/install_wp.sh & exec php-fpm81 -F