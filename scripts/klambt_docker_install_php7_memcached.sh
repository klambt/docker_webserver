#!/bin/bash

if [ "$USE_PHP7_MEMCACHE" = 1 ]; then
    echo '#############################################'
    echo '#          INSTALL PHP7 Memcached           #'
    echo '#                                           #'
    echo '#  This can be disabled during build with:  #'
    echo '#  -e "USE_PHP7_MEMCACHE=0"                 #'
    echo '#                                           #'
    echo '#############################################'

    git clone https://github.com/php-memcached-dev/php-memcached /usr/src/php/ext/memcached
    cd /usr/src/php/ext/memcached && git checkout -b php7 origin/php7
    docker-php-ext-configure memcached
    docker-php-ext-install memcached 

else
    echo ' '
    echo '#############################################'
    echo '#      NOT installing PHP7 Memcached        #'
    echo '#                                           #'
    echo '#  This can be enabled during build with:   #'
    echo '#  -e "USE_PHP7_MEMCACHE=1"                 #'
    echo '#                                           #'
    echo '#############################################'
    echo ' '
fi
