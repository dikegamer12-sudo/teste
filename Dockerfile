FROM php:8.1-apache

# Habilitar mod_rewrite do Apache
RUN a2enmod rewrite

WORKDIR /var/www/html

# Copiar arquivos do projeto
COPY . /var/www/html/

# Instalar extensões necessárias do PHP
RUN docker-php-ext-install pdo pdo_mysql

# Permissões
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80

CMD ["apache2-foreground"]
