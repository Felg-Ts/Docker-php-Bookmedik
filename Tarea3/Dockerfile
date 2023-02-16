FROM php:7.4-apache-bullseye
RUN apt update && apt upgrade -y && apt install apache2 mariadb-client git -y && docker-php-ext-install mysqli pdo pdo_mysql
RUN git clone https://github.com/evilnapsis/bookmedik.git && cp -r bookmedik/* /var/www/html && rm -r bookmedik && sed -i 's/create database bookmedik;/#create database bookmedik;/g' "/var/www/html/core/controller/Database.php" && apt remove --purge git -y && apt clean
WORKDIR /var/www/html
ADD script.sh /opt/
RUN sed -i '/DocumentRoot \/var\/www\/html/i\        ServerName 127.0.0.1\n' /etc/apache2/sites-available/000-default.conf && chmod +x /opt/script.sh
CMD ["/opt/script.sh"]
