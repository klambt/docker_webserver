# klambt/webserver

This Dockerimage is intented to be used with:
* Static Websites which are stored as zip or tar.gz and can be loaded via wget
* KLAMBT/Drupal (at: [Dockerhub](https://hub.docker.com/r/klambt/drupal/) or [Github](https://github.com/klambt/docker_drupal)).

The Docker provides an apache2 Server [php:7.0-apache](https://hub.docker.com/_/php/) or an apache2 Server [php:5.6-apache](https://hub.docker.com/_/php/) (Depending on the Tag) 

Autobuild
======
This Image will be updated if:
* The [php](https://hub.docker.com/_/php/) Base Image is Updated (hook)
* We change it in github

TAGS
======
* latest - Base Image [php:7.0-apache](https://hub.docker.com/_/php/)
* php-7 - Base Image [php:7.0-apache](https://hub.docker.com/_/php/)
* php-5.6 - Base Image [php:5.6-apache](https://hub.docker.com/_/php/)

Added Debian Packages
======
* libpng12-dev
* libjpeg-dev
* libpq-dev
* libz-dev
* wget
* zip
* unzip
* git
* libmemcached-dev
* libdbd-mysql-perl
* libdbi-perl
* libmysqlclient18
* libterm-readkey-perl
* mysql-client-5.5
* mysql-common
* sudo

Added Apache2 Modules
======
* [Google PageSpeed Module] (https://developers.google.com/speed/pagespeed/module/)
* Rewrite

Added php Modules
======
* gd
* mbstring
* pdo
* pdo_mysql
* zip
* memcached (for php7 compiled from sources [php-memcached-dev] (https://github.com/php-memcached-dev/php-memcached))

Added php scripts
======
* [PHP composer] (https://getcomposer.org)

Environment Options (during Build)
======
* UPDATE_DEBIAN (default:1) - option to skip updates
* INSTALL_PAGESPEED (default:1) - option to install [Google PageSpeed Module] (https://developers.google.com/speed/pagespeed/module/)
* INSTALL_COMPOSER (default:1) - option to install [PHP composer] (https://getcomposer.org)
* USE_OPCACHE_OPTIMIZATION (default:1) - setting up basic opcache optimization
* USE_PHP7_MEMCACHE (default:1) - compile and install php7 [php-memcached-dev] (https://github.com/php-memcached-dev/php-memcached) modul
* WORKDIR (default:/var/www/html) - htdocs directory
* LANGUAGE (default:de_DE.UTF-8) - Linux Language
* TIMEZONE (default:Europe/Berlin) - Timezone of the Image
* APACHE2_PORT (default: 80) - Apache2 Listening Port
* DOWNLOAD_APP_BUILD_FROM (default: 0) - Download an zip or tar.gz file to serve as Website
* COPY_EMPTY_WWW (default: 0) - Serve an empty wwwroot
* SETUP_FOR_PRODUCTION (default: 0) - Serve as Production or Testing Server

Environment Options (during Runtime)
=====
* DOWNLOAD_APP_RUN_FROM (default: 0) - Download an zip or tar.gz file to serve as Website


PULL
=======
```docker pull klambt/webserver:latest```

Building
========

```docker build -t klambt/webserver:latest .```

Exposed Ports
=======
* 80 - HTTP Port


Please see klambt/drupal at [Dockerhub](https://hub.docker.com/r/klambt/drupal/) or [Github](https://github.com/klambt/docker_drupal) for run examples.
