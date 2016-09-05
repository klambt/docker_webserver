#!/bin/bash
echo ' '
echo '#############################################'
echo '#        INSTALL ADDITIONAL PACKAGES        #'
echo '#                                           #'
echo '#############################################'
echo ' '

apt-get install -y $(grep -vE "^\s*#" /root/conf/apt-get_packages.conf  | tr "\n" " ")
docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr
docker-php-ext-install $(grep -vE "^\s*#" /root/conf/php_extentions.conf  | tr "\n" " ")
docker-php-ext-install sockets
a2enmod rewrite
a2enmod setenvif