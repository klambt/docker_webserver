# klambt/webserver

Apache 2.4.25+, [mod_brotli](https://github.com/kjdev/apache-mod-brotli.git),[Google PageSpeed Module](https://developers.google.com/speed/pagespeed/module/), PHP 7.0.18+, [PHP composer](https://getcomposer.org)

Autobuild
======
This Image will be updated if:
* The [tweyand/ubuntu:zesty](https://hub.docker.com/r/tweyand/ubuntu/) Base Image is Updated (hook)
* We change it in github

TAGS
======
| tag                          | Dockerfile                      | size |
| ---------------------------- | -------------------------------- | ---- |
| ```latest```, ```php7.0``` | [Dockerfile](https://github.com/klambt/docker_webserver/blob/master/Dockerfile)   | [![](https://images.microbadger.com/badges/image/klambt/webserver:php7.0.svg)](https://microbadger.com/images/klambt/webserver:php7.0 "Get your own image badge on microbadger.com") |


Added Debian Packages
======
* libedit2
* libsqlite3-0
* libxml2
* apache2
* git
* mysql-client
* unzip
* vim
* libfreetype6-dev
* libjpeg-turbo8
* libxml2-dev
* libpng-dev
* cron
* ssmtp
* sudo
* php-memcached
* php-mysql
* php-xml
* php7.0-curl
* php-uploadprogress
* php7.0-mbstring
* php7.0-common
* php7.0-gd
* php7.0-opcache
* php7.0-bcmath
* memcached
* libapache2-mod-php
* ruby-full
* rubygems

Added Apache2 Modules
======
* [Google PageSpeed Module](https://developers.google.com/speed/pagespeed/module/)
* [Brotli](https://github.com/kjdev/apache-mod-brotli.git)
* Rewrite

Added php 7 Modules
======
* memcached
* mysql
* xml
* curl                                            
* mbstring
* common
* gd
* opcache
* bcmath
* php-uploadprogress

Added php scripts
======
* [PHP composer](https://getcomposer.org)

Environment Options (during Build)
======
* INSTALL_PAGESPEED (default:1) - option to install [Google PageSpeed Module](https://developers.google.com/speed/pagespeed/module/)
* INSTALL_COMPOSER (default:1) - option to install [PHP composer](https://getcomposer.org)
* WORKDIR (default:/var/www/html) - htdocs directory
* LANGUAGE (default:de_DE.UTF-8) - Linux Language
* TIMEZONE (default:Europe/Berlin) - Timezone of the Image
* SETUP_FOR_PRODUCTION (default: 1) - Serve as Production or Testing Server

PULL
=======
```docker pull klambt/webserver:latest```

Building
========

```docker build -t klambt/webserver:latest .```

Exposed Ports
=======
* 80 - HTTP Port
