#!/bin/bash
if [ "$INSTALL_COMPOSER" = 1 ]; then
    echo '#############################################'
    echo '#          INSTALL PHP Composer             #'
    echo '#                                           #'
    echo '#  This can be disabled during build with:  #'
    echo '#  -e "INSTALL_COMPOSER=0"                  #'
    echo '#                                           #'
    echo '#############################################'

    sudo -u www-data wget https://getcomposer.org/installer
    php installer --install-dir=/usr/local/bin --filename=composer
else
    echo ' '
    echo '#############################################'
    echo '#      NOT installing PHP Composer          #'
    echo '#                                           #'
    echo '#  This can be enabled during build with:   #'
    echo '#  -e "INSTALL_COMPOSER=1"                  #'
    echo '#                                           #'
    echo '#############################################'
    echo ' '
fi
