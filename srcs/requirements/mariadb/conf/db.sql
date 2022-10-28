
-- Create Database
CREATE DATABASE IF NOT EXISTS wordpress_db;
USE wordpress_db;

-- Create User
CREATE USER IF NOT EXISTS 'cybattis'@'%' IDENTIFIED BY 'inception';
GRANT ALL PRIVILEGES ON wordpress_db.* TO 'cybattis'@'%' IDENTIFIED BY 'inception';
FLUSH PRIVILEGES;
