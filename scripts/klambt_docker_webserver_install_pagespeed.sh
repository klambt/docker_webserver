#!/bin/bash

if [ "$INSTALL_PAGESPEED" != 1 ]; then
    echo ' '
    echo '#############################################'
    echo '#      NOT installing Google Pagespeed      #'
    echo '#                                           #'
    echo '#  This can be enabled during build with:   #'
    echo '#  -e "INSTALL_PAGESPEED=1"                 #'
    echo '#                                           #'
    echo '#############################################'
    echo ' '
else
    echo '#############################################'
    echo '#          INSTALL GOOGLE PAGESPEED         #'
    echo '#                                           #'
    echo '#  This can be disabled during build with:  #'
    echo '#  -e "INSTALL_PAGESPEED=0"                 #'
    echo '#                                           #'
    echo '#############################################'

    cd /tmp
    wget https://dl-ssl.google.com/dl/linux/direct/mod-pagespeed-beta_current_amd64.deb
    dpkg -i mod-pagespeed-*.deb
    rm -f mod-pagespeed-*.deb
    apt-get -f install -y
    chmod 777 /var/cache/mod_pagespeed
    chmod 777 /var/log/pagespeed
    cp /root/docker-conf/apache2/pagespeed.conf /etc/apache2/mods-enabled/pagespeed.conf
fi
