FROM php:5.6-cli-jessie

RUN apt-get update && apt-get install -qy git curl libmcrypt-dev mysql-client unzip libxml2-dev zlib1g-dev sqlite3 p7zip-full openssh-client rsync
RUN apt-get clean -y && docker-php-ext-install soap
RUN docker-php-ext-install zip

## Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

## Install Deployer with recipes
RUN composer global require deployer/deployer
RUN composer global require deployer/recipes --dev

## Add Composer vendor into PATH
ENV PATH /root/.composer/vendor/bin:$PATH

