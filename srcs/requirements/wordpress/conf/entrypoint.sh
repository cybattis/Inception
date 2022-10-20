#!/bin/bash
set -e

# set_config() {
# 	key="$1"
# 	value="$2"
# 	php_escaped_value="$(php -r 'var_export($argv[1]);' "$value")"
# 	sed_escaped_value="$(echo "$php_escaped_value" | sed 's/[\/&]/\\&/g')"
# 	sed -ri "s/((['\"])$key\2\s*,\s*)(['\"]).*\3/\1$sed_escaped_value/" wp-config.php
# }

# set_config 'DB_HOST' "$WORDPRESS_DB_HOST"
# set_config 'DB_USER' "$WORDPRESS_DB_USER"
# set_config 'DB_PASSWORD' "$WORDPRESS_DB_PASSWORD"
# set_config 'DB_NAME' "$WORDPRESS_DB_NAME"

exec "$@"
