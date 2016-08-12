#!/bin/bash

echo ' '
echo '#############################################'
echo '#          SETTING UP ENVIRONMENT           #'
echo '#                                           #'
echo '#  This can be changed during build with:   #'
echo '#  -e "LANGUAGE=de_DE.UTF-8"                #'
echo '#  -e "TIMEZONE=EUROPE/BERLIN"              #'
echo '#                                           #'
echo '#############################################'
echo ' '

export LANGUAGE=$LANGUAGE
export LANG=$LANGUAGE
export LC_ALL=$LANGUAGE
echo $TIMEZONE > /etc/timezone
DEBIAN_FRONTEND=noninteractive