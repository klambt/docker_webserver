#!/bin/bash
echo '#############################################'
echo '#              KLAMBT/webserver             #'
echo '#                                           #'
echo '#   Build Options - Environment Variables   #'
echo '#                                           #'
echo '#             [Default Values]              #'
echo '#############################################'
echo "INSTALL_PHP7: $INSTALL_PHP7 [1]"
echo "INSTALL_GEM: $INSTALL_GEM [1]"
echo "INSTALL_PAGESPEED: $INSTALL_PAGESPEED [1]"
echo "INSTALL_COMPOSER: $INSTALL_COMPOSER [1]"
echo "INSTALL_BROTLI: $INSTALL_BROTLI [1]"
echo "USE_OPCACHE_OPTIMIZATION: $USE_OPCACHE_OPTIMIZATION [1]"
echo "WORKDIR: $WORKDIR [/var/www/html]"
echo "LANGUAGE: $LANGUAGE [de_DE.UTF-8]"
echo "TIMEZONE: $TIMEZONE [Europe/Berlin]"
echo "DOWNLOAD_APP_BUILD_FROM: $DOWNLOAD_APP_BUILD_FROM [0]"
echo "DOWNLOAD_APP_RUN_FROM: $DOWNLOAD_APP_RUN_FROM [0]"
echo "COPY_EMPTY_WWW: $COPY_EMPTY_WWW [0]"
echo "SETUP_FOR_PRODUCTION: $SETUP_FOR_PRODUCTION [1]"
echo "KLAMBT_WEBSERVER_PRODUCTION: $KLAMBT_WEBSERVER_PRODUCTION [$SETUP_FOR_PRODUCTION]"


echo "$TIMEZONE" > /etc/timezone
