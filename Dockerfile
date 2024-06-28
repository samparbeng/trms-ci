FROM php:8.1-apache

RUN apt-get update && apt-get install -y \
libpng-dev \
libjpeg-devlibfreetype6-dev \
libzip-dev \
unzip \
&& docker-php-ext-configure gd --with-freetype --with-jpeg \
&& docker-php-ext-install pdo_mysql gd mysqli zip

# Enable apache mod_rewrite
RUN a2enmod mod mod rewrite

# Set Working Directoy
WORKDIR /var/www/html

# Copy Application Source Code to the container
COPY . .

# Expose the port
EXPOSE 80

#Start Apache in the foreground
CMD ["apache2-foreground"]