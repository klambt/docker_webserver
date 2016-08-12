#!/bin/bash
echo ' '
echo '#############################################'
echo '#        INSTALL ADDITIONAL PACKAGES        #'
echo '#                                           #'
echo '#############################################'
echo ' '

apt-get install -y $(grep -vE "^\s*#" /root/conf/apt-get_packages.conf  | tr "\n" " ")
rm -rf /var/lib/apt/lists/* 
docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr
docker-php-ext-install $(grep -vE "^\s*#" /root/conf/php_extentions.conf  | tr "\n" " ")
a2enmod rewrite