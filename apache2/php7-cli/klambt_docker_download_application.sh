#!/bin/bash

if [ "$COPY_EMPTY_WWW" = 1 ]; then
    echo ' '
    echo '#############################################'
    echo '#          Copy a basic index.html          #'
    echo '#                to wwwroot                 #'
    echo '#                                           #'
    echo '#############################################'
    echo ' '
    cp -R /root/empty_html/* /var/www/html
fi

if [ "$DOWNLOAD_APP_RUN_FROM" != 0 ]; then
    echo '###############################################'
    echo '#  Setting the Variable DOWNLOAD_APP_RUN_FROM #'
    echo '#   is NOT allowed during Build!              #'
    echo '#                                             #'
    echo '###############################################'
    exit;
fi

if [ "$DOWNLOAD_APP_BUILD_FROM" != 0 ]; then
    echo ' '
    echo '#############################################'
    echo '#           DOWNLOAD APPLICATION:           #'
    echo '#                                           #'
    echo "#  $DOWNLOAD_APP_BUILD_FROM"
    echo '#                                           #'
    echo '#                to wwwroot                 #'
    echo '#                                           #'
    echo '#############################################'
    echo ' '

    # @todo fix me
    # 
    #if [ 'echo $DOWNLOAD_APP_BUILD_FROM | grep .zip' -ne ] ; then
    #    echo ' '
    #    echo '#############################################'
    #    echo '# zip is currently not supportet :(         #'
    #    echo '#                                           #'
    #    echo '# please use .tar.gz files                  #'
    #    echo '#############################################'
    #    exit 1;
    #fi

    #if [ 'echo $DOWNLOAD_APP_BUILD_FROM | grep .tar,gz | wc -l' != '0' ] ; then
        rm -rf /var/www/html/*
        mkdir /tmp/download-www
        cd /tmp/download-www
        wget $DOWNLOAD_APP_BUILD_FROM
        tar -xzf *.tar.gz
        rm *.tar.gz
        dir=`ls -l /tmp/download-www/ | awk '{print $9}'`
        mv $dir/* .
        rm -rf $dir
    #fi 

    mv /tmp/download-www/* /var/www/html/
fi