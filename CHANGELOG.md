# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

- New PHP 7.2 image is now available on the dev tag. Please report any issues.

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
