FROM ubuntu:16.04 AS simple-php-70

RUN apt-get update

RUN apt-get install -y \
			git \
			vim \
			software-properties-common \
			python-software-properties \
			curl

# Install nginx
RUN apt-get install -y nginx

# Install PHP
RUN LC_ALL=C.UTF-8 add-apt-repository -y -u ppa:ondrej/php
RUN apt-get update
RUN apt-get install -y \
			php7.0-fpm \
			php7.0-cli \
			php7.0-common \
			php7.0-mbstring \
			php7.0-gd \
			php7.0-intl \
			php7.0-xml \
			php7.0-mysql \
			php7.0-pdo \
			php7.0-opcache \
			php7.0-zip \
			php7.0-dev \
			php7.0-mcrypt \
			php7.0-curl

RUN mkdir -p /run/php

RUN sed -i -- "s/;clear_env = no/clear_env = no/g" /etc/php/7.0/fpm/pool.d/www.conf

# Install composer
RUN cd /opt && curl -sS https://getcomposer.org/installer -o composer-setup.php && php composer-setup.php --install-dir=/usr/bin --filename=composer && rm composer-setup.php

EXPOSE 80 443