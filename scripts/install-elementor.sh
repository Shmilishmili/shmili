#!/bin/sh
set -e

WP="wp --path=/var/www/html --allow-root"

echo "Waiting for wp-config.php..."
until [ -f /var/www/html/wp-config.php ]; do
  sleep 2
done

echo "Waiting for database..."
until $WP db check >/dev/null 2>&1; do
  sleep 3
done

if ! $WP core is-installed >/dev/null 2>&1; then
  echo "Installing WordPress core..."
  $WP core install \
    --url="$WP_URL" \
    --title="$WP_TITLE" \
    --admin_user="$WP_ADMIN_USER" \
    --admin_password="$WP_ADMIN_PASSWORD" \
    --admin_email="$WP_ADMIN_EMAIL" \
    --skip-email
fi

echo "Installing and activating Elementor..."
$WP plugin install elementor --activate

echo "Done. Elementor is installed and active."
