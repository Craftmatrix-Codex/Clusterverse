#!/usr/bin/env bash
set -Eeuo pipefail
php artisan migrate --force
exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
