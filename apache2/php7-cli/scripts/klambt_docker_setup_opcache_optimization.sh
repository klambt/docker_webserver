#!/bin/bash
echo ' '

if [ "$USE_OPCACHE_OPTIMIZATION" = 1 ]; then

    echo '#############################################'
    echo '#      SETTING UP OPCACHE OPTIMIZATION      #'
    echo '#                                           #'
    echo '#  This can be disabled during build with:  #'
    echo '#  -e "USE_OPCACHE_OPTIMIZATION=0"          #'
    echo '#                                           #'
    echo '#############################################'

    { \
                    echo 'opcache.memory_consumption=256'; \
                    echo 'opcache.interned_strings_buffer=8'; \
                    echo 'opcache.max_accelerated_files=4000'; \
                    echo 'opcache.revalidate_freq=60'; \
                    echo 'opcache.fast_shutdown=1'; \
                    echo 'opcache.enable_cli=1'; \
    } > /usr/local/etc/php/conf.d/opcache-recommended.ini
else
    echo '#############################################'
    echo '#         SKIP OPCACHE OPTIMIZATION         #'
    echo '#                                           #'
    echo '#  This can be enabled during build with:   #'
    echo '#  -e "USE_OPCACHE_OPTIMIZATION=1"          #'
    echo '#                                           #'
    echo '#############################################'

fi
echo ' '