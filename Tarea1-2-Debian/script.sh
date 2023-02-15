#! /bin/sh

sed -i 's/create database bookmedik;/#create database bookmedik;/g' "schema.sql"
sed -i 's/this->user="root"/this->user=getenv("DB_USER")/g' "core/controller/Database.php"
sed -i 's/this->pass=""/this->pass=getenv("DB_PASS")/g' "core/controller/Database.php"
sed -i 's/this->host="localhost"/this->host=getenv("DB_HOST")/g' "core/controller/Database.php"
sed -i 's/this->ddbb="bookmedik"/this->ddbb=getenv("DB_NAME")/g' "core/controller/Database.php"

while ! mysql -u ${DB_USER} -p${DB_PASS} -h ${DB_HOST}  -e ";" ; do
	sleep 1
done	
mysql -u $DB_USER --password=$DB_PASS -h $DB_HOST $DB_NAME < /var/www/html/schema.sql

apache2ctl -D FOREGROUND