<?php
$connection = new PDO('mysql:host=mysql;dbname=mysql;charset=utf8', 'root', '123456');
$connection->exec( "CREATE DATABASE IF NOT EXISTS phpip DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;");
$connection->exec( "CREATE USER IF NOT EXISTS phpip@localhost IDENTIFIED BY 'phpip';");
$connection->exec( "GRANT ALL PRIVILEGES ON phpip.* TO phpip@localhost;");
$connection->exec( "SET GLOBAL log_bin_trust_function_creators = 1;");
echo "Configuration of Mysql done\n";
