# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

- N/A

## [21.1.2] - 2018-02-04

### Fixed
- Helper script `bin/fixowns` now fixes permissions on `/var/www` instead of `/var/www/html` folder.
- Removed superfluous mounting of `~/.composer` directory in `docker-compose.dev.yml` file.

## [21.1.1] - 2018-12-27

### Fixed
- Helper script `bin/copytocontainer` now calls `bin/fixowns` afterwards to ensure correct file ownerships are set.

## [21.1.0] - 2018-12-26

### Added
- Helper script `bin/removevolumes` to remove docker volumes easily.
- Added removal of `vendor` folder and force of composer install to `bin/setup` script. When installed from zip, it's possible Magento isn't installing all deps properly and assigning wrong permissions in Docker. Forcing a reinstall fixes this issue.
- Force deploy of static content when running `bin/setup` to speed up initial requests.

### Fixed
- Fixed helper script `bin/dev-urn-catalog-generate` to copy file to host.

## [21.0.0] - 2018-12-24

🎅 Santa Shust wishes you a very Merry Christmas!

### Changed
- 💯 performance improvements (14 second load times now take 7 seconds!)
  - The `bin/start` helper script no longer copies docker volumes introduced in version 18.0.0. The `docker-compose.yml` setup has been updated to only reference native Docker volumes. A new `docker-compose.dev.yml` file has been added to reference development-specific settings, including host bind mounts. Only `.composer`, `app/code`, `app/design`, `app/etc`, `composer.json`, `composer.lock`, and `nginx.conf` filesystem locations are host bind mounted. Being very specific in which files and folders are being mounted leads to drastically faster response times. The main culprit in performance penalties before was mounting `generated` and `var` folders as host bind mounts. These directories are considered "caching" folders and should never be host bind mounted.
  - If you need access to specific files that are created within the container and are not host bind mounted, you can use `bin/cli` or `bin/bash` commands to go into the container to access the files. You can also use the new `bin/copyfromcontainer` and `bin/copytocontainer` bin helper scripts to copy files & folders from or to containers.
  - If you need to host bind mount files or folders, feel free to do so within the `docker-compose.dev.yml` file! Just be aware there is a performance penalty for doing so.
- Updated `nginx` Docker image to look for `nginx.conf` file instead of `nginx.conf.sample` file. This will now require copying the `nginx.conf.sample` file to `nginx.conf`, or using a host bind mount. This location allows overrides that aren't overridden when you upgrade Magento, and allow customizations for projects. Tagged new image as `markoshust/magento-nginx:1.13-7`.
- The `bin/setup` helper script uses ohly the `docker-compose.yml` file, with only native docker volume mounts.
- The `bin/start` helper script uses both `docker-compose.yml` and `docker-compose.dev.yml` files. Development-only specifications should now be placed within `docker-compose.dev.yml`, such as host bind volume mounts.
- The `docker-compose.yml` file now uses a `sockdata` volume mount to mount the `/sock` directory. You may need to delete the `appdata` volume mount (`docker volume rm NAME`) and rebuild it with `bin/copytocontainer --all`.
- Removed call to `bin/fixperms` within `bin/setup` to speed up initial installation.

### Added
- Added `bin/copyfromcontainer` and `bin/copytocontainer` helper scripts to copy folders or files from or to containers. Specify the `--all` option to copy entire web directory structure.
- Added `bin/rootnotty` to run root commands with no TTY (needed for unassisted one-line setup with new volume setup).
- Added `bin/fixowns` to fix filesystem ownerships within the Docker container.
- Added `docker-compose.dev.yml` file for development-only specifications.

### Removed
- The Magento 1 version of this development environment has been deprecated and is no longer supported. PHP 5 was used as it's base, and that version has reached end-of-life. If you still wish to use this setup, please reference [compose/magento-1 on tag 20.1.1](https://github.com/markshust/docker-magento/tree/master/compose/magento-1), but please be aware these images are no longer maintained.
- The PHP 5.6 and 7.0 images have been deprecated, as both of these versions have reached end-of-life. These versions have been removed from the README and are no longer maintained. If you still wish to use these images, please reference the [README on tag 20.1.1](https://github.com/markshust/docker-magento/blob/master/README.md), but please be aware these images are no longer maintained.
- Removed `bin/copydir` and `bin/copydirall` helper scripts.

## [20.1.1] - 2018-12-10

### Fixed
- Fixed typo in docker-compose.yml for linux

## [20.1.0] - 2018-12-03

### Added
- Official support for Elasticsearch. Go to Admin > Stores > Configuration > Catalog > Catalog > Catalog Search, and select "Elasticsarch 5.0+" from the list of options. Keep all defaults the same, but set Elasticsearch Server Hostname to `elasticsearch`. Save, clear the cache, and run `bin/magento indexer:reindex` to enable.

## [20.0.0] - 2018-11-27

### Added
- Official support for Magento 2.3 & PHP 7.2. Officially tagging `7.2-fpm-0` php image.

### Updated
- Various updates to README, including references now being made to Magento 2.3.
- Added comments to docker-compose for fixes needed on Linux machines (volume mounts and host.docker.internal fix).

### Fixed
- Volume mount issues on linux. Updated `bin/start` to ignore call to `bin/copydirall` when ran on Linux.

## [19.0.0] - 2018-10-08

### Added
- Added SSL support and made it enabled by default in the nginx config. All http requests will also be forwarded to https.

## [18.1.1] - 2018-10-08

### Updated
- Magento 2 nginx configuration now includes `nginx.conf.sample` file from root installation directory for configuration, instead of having standalone configuration.

## [18.0.1] - 2018-10-08

### Fixed
- Reverted old `bin/cli` usage and created `bin/clinotty` for non-tty sessions. Updated calls in `bin/setup` and other scripts where appropriate to `bin/clinotty`.

## [18.0.0] - 2018-10-06

### Changed
- Changed the way bind mounts work with Docker compose and Magento 2.
    - Note that `bin/start` now includes a call to `bin/copydirall` after the containers start. This helper script runs a `docker cp` command of all Magento directories from the container to the host. There is still a bind mount setup to `./src` root directory.
    - There is a condition/bug within Docker that when named volumes overlap with bind mounts, the named volumes automatically sync back to the host once a `docker cp` command runs, while retaining their named volume status within the Docker container.
    - We're tapping into this very odd bug and taking advantage of this as long as we can. Since data is still fetched from within the Docker container as a named volume, this should also allow not-so-performant computers to now run this Docker setup, as it provides near or truly native filesystem performance, since requests to these directories are still fetched through the named volume as far as Docker is concerned.
- `bin/start` now runs in daemon mode, as we also need to run `bin/copydirall` immediately after starting containers so data syncs back to the host (and vice versa). This also eliminates the need to to have a terminal window open all the time for keeping containers running.

### Added
- Added back support for Magento 1 and PHP 5.6 containers. Magento 1 EOL will not be until 2020, so we should support these images and Docker Compose setup indefinitely for the time being.
- Added new `bin/restart` helper script to stop and start all containers.
- Added new `bin/remove` helper script to remove all containers.
- Added new `bin/copydir` which copies whichever folder you wish from the container to the host.
- Added new `bin/copydirall` which copies all Magento folders from the container to the host.
- Added `lib/template` and `lib/onelinesetup` for much easier installation methods.
- Added automatic Xdebug support for VS Code - no setup needed!

### Removed
- Removed `bin/initloopback` along with any references to `10.254.254.254` ip address. This may break existing Xdebug setups. Note that this ip address has been replaced with `host.docker.internal`, which should automatically resolve back to the host machine.

## [17.0.1] - 2018-10-06

### Removed
- Removed bind mount of vendor folder introduced in 16.2.0 due to inconsistency issues. Update cominmg soon that will implement new method of bind mounting.

## [17.0.0] - 2018-09-06

### Removed
- Removed idekey setting from php.ini config.

### Changed
- Simplified Xdebug configuration for PHPStorm. This will require configuration updates for all users using Xdebug within PHPStorm.

### Added
- Added support for Xdebug and VS Code.

## [16.2.0] - 2018-08-29

### Changed
- Updated docker-compose.yml file to volume mount vendor folder for 50% performance increase

## [16.1.0] - 2018-08-23

### Added
- Added php ssh2 extension

### Deprecated
- The PHP 5.6 release will no longer be maintained, the last released version is 16.0.0

## [16.0.0] - 2018-08-22

### Changed
- Moved `dev/auth.json` to `dev/composer/auth.json`
- Added `client_max_body_size 20M` to nginx.conf
- Added `upload_max_filesize = 20M` and `post_max_size = 20M` to php.ini

## [15.0.1] - 2018-08-03

### Fixed
- Bugs with npm permissions.

## [15.0.0] - 2018-08-03

### Added
- NodeJS 8 and npm 5 added to the PHP images!
- New PHP 7.2 image. Be aware that this hasn't yet been fully tested.
- New helper scripts bin/grunt, bin/node, bin/npm and bin/stop.

### Changed
- All bin helper script calls from ./bin/name to bin/name.
- Updated bin scripts for Windows, possible breaking updates.

## [14.0.1] - 2018-07-28

### Fixed
- Magento 2.2.5 requires username and password to be different values. Updated to dummy "John Smith" user persona with username `john.smith` and password `password123`.

## [14.0.0] - 2018-07-21

### Added
- New `dev/auth.json` file used instead of `~/.composer/auth.json` file, so each project can have different auth credentials.

### Changed
- The `cron` service is now disabled by default. This services uses higher CPU and should probably only be enabled when working on cron-related tasks (or on production).
