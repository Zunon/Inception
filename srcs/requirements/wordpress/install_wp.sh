#!/bin/bash

# Configuration parameters
WP_URL="https://webserver"
WP_TITLE="Living With Cats"
WP_ADMIN_USER="Zunon"
WP_ADMIN_PASSWORD="123243561"
WP_ADMIN_EMAIL="zunon@zunon.io"

echo "Waiting for WordPress to start..."
sleep 5

echo "Setting up WordPress..."
curl -k -d "weblog_title=$WP_TITLE&user_name=$WP_ADMIN_USER&admin_password=$WP_ADMIN_PASSWORD&admin_password2=$WP_ADMIN_PASSWORD&admin_email=$WP_ADMIN_EMAIL" "$WP_URL/wp-admin/install.php?step=2"


echo "WordPress setup complete."