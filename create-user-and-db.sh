#! /usr/bin/env bash

USER_BACKTICK=$(printf "\140$1\140")
USER=$1
PASS=$2

mysql -uroot <<MYSQL_SCRIPT
CREATE DATABASE $USER_BACKTICK;
CREATE USER $USER_BACKTICK@'localhost' IDENTIFIED BY '$PASS';
GRANT ALL PRIVILEGES ON $USER_BACKTICK.* TO $USER_BACKTICK@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT


echo "MySQL database & user created."
echo "DB:         $USER"
echo "Username:   $USER"
echo "Password:   $PASS"
