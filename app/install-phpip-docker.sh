#!/bin/bash

echo "
********************************
Getting phpIP from GitHub
********************************"
cd /var/www/html
git clone https://github.com/jjdejong/phpip.git phpip 
cp .env.docker phpip/.env
echo "
********************************
Configuring MySQL
********************************"
php init_db.php

echo "
********************************
Installing dependencies
********************************"
cd phpip
composer install
php artisan key:generate
php artisan config:clear
chmod -R g+rw storage
chmod -R g+rw bootstrap/cache
chgrp -R www-data storage
chgrp -R www-data bootstrap/cache

echo "
********************************
Installing database
********************************"
php artisan migrate --seed

echo "
********************************
Install finished. If you want to populate the database with sample data run
the following commands: 
docker-compose exec php-apache php ./artisan db:seed --class=SampleSeeder

Go to http://localhost:81 and login with the credentials phpipuser:changeme
********************************"
