if [ ! -d "htdocs/wp-admin" ]; then
	echo 'Installing WordPress (release version) in jumpshot/htdocs...'
	if [ ! -d "./htdocs" ]; then
		mkdir ./htdocs
	fi
	cd ./htdocs
	wp core download --allow-root 
	wp core config --dbname="jumpshot" --dbuser=wp --dbpass=wp --dbhost="localhost" --allow-root --extra-php <<PHP
define('WP_DEBUG', true);
define('WP_DEBUG_LOG', true);
PHP
	wp core install --url=jumpshot.dev --title="jumpshot" --admin_user=admin --admin_password=password --admin_email=admin@localhost.dev --allow-root
	
	
	cd -

fi
