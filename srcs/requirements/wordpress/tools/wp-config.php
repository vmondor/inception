<?php
define('DB_NAME', getenv('SQL_DATABASE'));
define('DB_USER', getenv('SQL_USER'));
define('DB_PASSWORD', getenv('SQL_PASSWORD'));
define('DB_HOST', getenv('SQL_HOST'));
define('DB_CHARSET', 'utf8mb4');
define('DB_COLLATE', '');

define('AUTH_KEY', 'your_unique_auth_key');
define('SECURE_AUTH_KEY', 'your_unique_secure_auth_key');
define('LOGGED_IN_KEY', 'your_unique_logged_in_key');
define('NONCE_KEY', 'your_unique_nonce_key');
define('AUTH_SALT', 'your_unique_auth_salt');
define('SECURE_AUTH_SALT', 'your_unique_secure_auth_salt');
define('LOGGED_IN_SALT', 'your_unique_logged_in_salt');
define('NONCE_SALT', 'your_unique_nonce_salt');

$table_prefix = 'wp_';

define('WP_DEBUG', false);
define('WP_HOME', 'https://' . getenv('DOMAIN_NAME'));
define('WP_SITEURL', 'https://' . getenv('DOMAIN_NAME'));

if ( ! defined( 'ABSPATH' ) ) {
    define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}
require_once ABSPATH . 'wp-settings.php';
?>