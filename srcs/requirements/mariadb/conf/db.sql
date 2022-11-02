
-- Create Database
CREATE DATABASE IF NOT EXISTS wordpress_db DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE wordpress_db;

-- Create User
CREATE USER IF NOT EXISTS 'cybattis'@'%' IDENTIFIED BY '4242';
GRANT ALL PRIVILEGES ON wordpress_db.* TO 'cybattis'@'%' IDENTIFIED BY '4242';
FLUSH PRIVILEGES;
exit
