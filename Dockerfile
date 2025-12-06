FROM php:8.1-apache

# Habilitar mod_rewrite (opcional)
RUN a2enmod rewrite

# Instalar dependências comuns (opcional para outras libs)
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    && docker-php-ext-install pdo pdo_mysql

# Copiar seus arquivos para o servidor
COPY . /var/www/html/

# Permissões
RUN chown -R www-data:www-data /var/www/html
