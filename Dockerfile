FROM php:8.2.13-fpm-alpine

# Install dépeencies
RUN set -ex \
    && apk --no-cache add \
        postgresql-dev \
        unzip \
        libzip-dev \
        bash \
        git \
        icu-dev \
        make \
    && docker-php-ext-install zip pdo pdo_mysql intl
    

# Install PHP extensions
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions http

# Install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php composer-setup.php && php -r "unlink('composer-setup.php');" && mv composer.phar /usr/local/bin/composer

# Install Symfony CLI
RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.alpine.sh' | bash && apk add symfony-cli


# Install Node.js and Yarn
RUN apk --no-cache add nodejs npm yarn

# Ajustez les permissions
RUN chmod -R 775 /var/www/html

WORKDIR /var/www/
