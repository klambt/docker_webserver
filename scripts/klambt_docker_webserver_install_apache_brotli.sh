#!/bin/bash

if [ "$INSTALL_BROTLI" = 1 ]; then
    echo '#############################################'
    echo '#         INSTALL BROTLI SUPPORT            #'
    echo '#                                           #'
    echo '#  This can be disabled during build with:  #'
    echo '#  -e "INSTALL_BROTLI=0"                 #'
    echo '#                                           #'
    echo '#############################################'

    apt-get install --no-install-recommends -qy brotli cmake build-essential automake autoconf apache2-dev

    cd /tmp
    git clone --depth=1 --recursive https://github.com/kjdev/apache-mod-brotli.git
    cd apache-mod-brotli
    ./autogen.sh
    ./configure
    make
    install -p -m 755 -D .libs/mod_brotli.so /etc/apache2/modules/mod_brotli.so
    rm -rf /tmp/apache-mod-brotli
    apt-get remove -y cmake build-essential automake autoconf apache2-dev

    cp /root/docker-conf/apache2/brotli.load /etc/apache2/mods-available/brotli.load
    cp /root/docker-conf/apache2/brotli.conf /etc/apache2/mods-available/brotli.conf

    a2enmod brotli
else
    echo ' '
    echo '#############################################'
    echo '#      NOT installing BROTLI SUPPORT        #'
    echo '#                                           #'
    echo '#  This can be enabled during build with:   #'
    echo '#  -e "INSTALL_BROTLI=1"                    #'
    echo '#                                           #'
    echo '#############################################'
    echo ' '
fi
