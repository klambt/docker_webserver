#!/bin/bash
if [ "$INSTALL_GEM" = 1 ]; then
    echo '#############################################'
    echo '#         INSTALL gem packages              #'
    echo '#                                           #'
    echo '#  This can be disabled during build with:  #'
    echo '#  -e "INSTALL_GEM=0"                       #'
    echo '#                                           #'
    echo '#############################################'

    cd /tmp/
    apt-get install --no-install-recommends -qy ruby-full rubygems
    gem install sass compass bourbon neat
else
    echo ' '
    echo '#############################################'
    echo '#      NOT installing GEM Packages          #'
    echo '#                                           #'
    echo '#  This can be enabled during build with:   #'
    echo '#  -e "INSTALL_GEM=1"                    #'
    echo '#                                           #'
    echo '#############################################'
    echo ' '
fi
