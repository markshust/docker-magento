# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

- PHP image `8.0-fpm-develop` now available for testing purposes.

## [35.0.0] - 2021-01-29

### Added
- Automatically purge caches for a better dev experience [#380](https://github.com/markshust/docker-magento/issues/380).
- Stop script execution on error [#363](https://github.com/markshust/docker-magento/pull/363/).
- Make xdebug command understand partials [#371](https://github.com/markshust/docker-magento/pull/371).
- Extended functionality for `bin/xdebug`, including new `status` and `toggle` commands [#332](https://github.com/markshust/docker-magento/pull/332).
- Check Elasticsearch connection before setup:install [#326](https://github.com/markshust/docker-magento/pull/326).

### Updated
- The onelinesetup now accepts a `community` or `enterprise` param to pick version to install [b2399ff1](https://github.com/markshust/docker-magento/commit/ad573f6f3c8d2f7066034cbde936a86eb2399ff1).
- Fix bin/start for macOS Big Sur [#355](https://github.com/markshust/docker-magento/pull/355/).

## [34.2.0] - 2020-10-15

### Updated
- Updated Composer to version `1.10.15` to avoid nag update messages in new PHP Docker images `7.3-fpm-9`, `7.4-fpm-2`.

## [34.1.0] - 2020-10-15

### Added
- HTTP/2 added to Nginx image `1.18-4`

### Updated
- `bin/download` falls back to using Composer if archive download fails or is not found.

## [34.0.0] - 2020-10-11

### Added
- New `bin/setup-integration-tests` script to setup integration tests [3c021ff](https://github.com/markshust/docker-magento/commit/3c021ff6c92e49fad669deed0805cceae26bdccf).
- Added `MYSQL_HOST` environment variable to `env/db.env` file.
- New Nginx `1.18-3` Docker images uses Alpine as base image [PR #306](https://github.com/markshust/docker-magento/pull/306).

### Updated
- Prevent containers from starting if volume mapping doesn't exist, validate volumes to avoid empty folder creation [PR #256](https://github.com/markshust/docker-magento/pull/256).
- Setup script uses MySQL `env/db.env` file for database connection credentials [PR #302](https://github.com/markshust/docker-magento/pull/302).
- Increased MySQL's `max_allowed_packet` to `64M` in `docker-compose.yml` file [PR #303](https://github.com/markshust/docker-magento/pull/303).
- `docker-compose.yml` now uses Alpine images for Redis and RabbitMQ [#305](https://github.com/markshust/docker-magento/pull/305).
- `docker-compose.yml` file now uses new Alpine images for Redis, RabbitMQ & Nginx.
- `bin/setup` script updated to use Redis for cache and session directly in installer script [PR #304](https://github.com/markshust/docker-magento/pull/304).
- `bin/setup` script sets Admin URL to `/admin` [PR #304](https://github.com/markshust/docker-magento/pull/304).
- Enabling/disabling Xdebug now only restarts `phpfpm` container rather than all containers [PR #314](https://github.com/markshust/docker-magento/pull/314).
- `bin/setup` script moves `.vscode` directory to `src` after install [846d02c](https://github.com/markshust/docker-magento/commit/846d02c12c5af8005fe0cbb0b167b97f501db0c9).

### Fixed
- Exception while running integration tests [#292](https://github.com/markshust/docker-magento/pull/292).
- Nested files not copying in copytocontainer script [#295](https://github.com/markshust/docker-magento/pull/295) [#296](https://github.com/markshust/docker-magento/pull/295).
- Ubuntu unable to start because of missing volumes [#309](https://github.com/markshust/docker-magento/issues/309).

## [33.0.0] - 2020-07-30

### Added
- The `php:7.4-fpm` Docker image has been setup with full support for Magento 2.4 (see [images/php/7.4](https://github.com/markshust/docker-magento/tree/master/images/php/7.4)).
- Added easy way to mount an SSH key to the container (see [#89](https://github.com/markshust/docker-magento/issues/89)).
- The `bin/download` script now falls back to Hypernode's Magento Download mirror in the event the archive doesn't exist or fails to download from Nexcess.

### Updated
- All Docker volumes now use `:cached` rather than `:delegated`. The `delegated` volume functionality is changing in a future version of Docker for Mac to use Mutagen volumes, and the implementation is very buggy & awkward. Using the `cached` flag retains the current functionality we've been using in `delegated` without any changes (confirmed in [docker/for-mac#1592](https://github.com/docker/for-mac/issues/1592#issuecomment-662504816)).
- Updated `bin/setup-ssl-ca` so SSL generation works on Linux ([#222](https://github.com/markshust/docker-magento/issues/222))
- Updated `php` Docker images to use most recent version of Composer (1.10.9).
- The `bin/setup` script now runs `composer update` rather than `composer install`. There was an error happening with `composer install`, and with the start of the project it's best to just get the most recent Composer packages anyway.
- The `bin/setup` script now sets Elasticsearch 7 as the default catalog search engine directly when executing `bin/magento setup:install`.

### Removed
- All `latest` tags have been removed on all Docker images. It is bad practice to not use a specific version. The `latest` tag will no longer be recompiled when new images are released.
- The `php:7.2` Docker images have been deprecated, as that version is no longer supported in Magento.
- The `elasticsearch:6` Docker images have been deprecated, as those versions are no longer supported in Magento.
- Removed invalid checksum hack fix in `bin/setup` for `google-shopping-api` package, as that is only applicable to older versions of Magento.

## [32.0.1] - 2020-05-12

### Fixed
- Backed out last Elasticsearch update with elasticsearch.yml, caused issues with startup.

## [32.0.0] - 2020-05-11

### Fixed
- Updated `bin/dev-urn-catalog-generate` to account for new versions of PHPStorm (simplified).
- Indexing error with possible ElasticSearch modules ([#262](https://github.com/markshust/docker-magento/issues/262)).

### Updated
- Updated ElasticSearch 6 to version 6.8.

## [31.0.2] - 2020-04-30

### Fixed
- Fixed typo in last build image, new version is `magento-nginx:1.18-2`.

## [31.0.1] - 2020-04-30

### Fixed
- Reverted old SSL cert, it needs to exist as default cert until new certs are generated.

## [31.0.0] - 2020-04-30

### Added
- New `magento-nginx:1.18` Docker image.
- New `magento-elasticsearch:7.6` Docker image.
- Documentation to install Magento directly with sample data (using `with-samples-` prefix (thanks Nexcess!).

### Updated
- The `bin/setup` helper script to enable Elasticsearch 7 and automatically reindex during installation.
- The `docker-compose.yml` file now references the `magento-nginx:1.18-0` and `magento-elasticsearch:7.6.2-0` Docker images.
- The `docker-compose.yml` adds the new environment variable `"discovery.type=single-node"` for compatibility with Elasticsearch 7.
- The new `nginx:1.18` Docker image sets `fastcgi_buffer_size 64k;` and `fastcgi_buffers 8 128k;` directives for Magento 2.3.5 compatibility.

### Removed
- Old SSL cert being generated directly on Nginx image (deprecated).
- References to Nginx 1.13 images (deprecated).

## [30.0.3] - 2020-04-25

### Updated
- Reverted disabling Temando_Shipping module in bin/magento for sample data installation. <a href="https://github.com/markshust/docker-magento/issues/250">#250</a>

## [30.0.2] - 2020-04-17

### Fixed
- The `Temando_Shipping` module conflicts with sample data installation. Added fix to `bin/magento` helper script to disable this module, install sample data, then re-enable it.

### Added
- Added a `--remove-orphans` flag to `bin/start` script to remove orphaned containers (applicable to cron service).

## [30.0.1] - 2020-03-18

### Updated
- Increased php.ini `memory_limit` to `4G` to get PHPUnit tests to pass
- Increased php.ini `upload_max_filesize` and `post_max_size` to `100M` just to prevent issues from being filed in the future

### Added
- New PHP image tags `7.2-fpm-9`, `7.3-fpm-6`

## [30.0.0] - 2020-03-09

### Added
- Added new CLI to connect to MySQL

### Updated
- Updated readme with new bin/mysql documentation
- n98-magerun2 to install on exec of `bin/n98-magerun2` instead of `bin/setup` script
- Increased `max_input_vars` to `10000` to prevent Invalid Form Post submission errors

### Fixed
- Fixed PHP ioncube module missing ioncube.so file
- Disable TTY on `bin/setup-ssl-ca script`
- Fixed `bin/copytocontainer` script not copying files to proper directory

## [29.0.0] - 2020-01-31

### Fixed
- Fixed implementation of grunt. The grunt-cli is now installed globally on the image and doesn't depend on contents of the `vendor` directory.

## [28.0.0] - 2020-01-31

### Updated
- Upgraded NodeJS to 10.x, as 8.x was failing to install npm due to source repository updates <a href="https://github.com/markshust/docker-magento/issues/210">#210</a>

### Removed
- Removed PHP 7.1 image from filesystem as it has been deprecated. If you need to reference the last version of these images, they are available at <a href="https://github.com/markshust/docker-magento/tree/27.2.0/images/php/7.1">https://github.com/markshust/docker-magento/tree/27.2.0/images/php/7.1</a>

## [27.2.0] - 2020-01-22

### Added
- Support for RabbitMQ <a href="https://github.com/markshust/docker-magento/pull/212">PR #212</a>

## [27.1.0] - 2020-01-20

### Added
- New `bin/setup-ssl` script to generate valid SSL certificates <a href="https://github.com/markshust/docker-magento/issues/211">#211</a>
- New `markoshust/magento-nginx:1.13-8` image containing mkcert script

### Updated
- Updated `bin/setup` to use new `bin/setup-ssl` script

## [27.0.0] - 2020-01-01

Happy new year! 🎉

### Updated
- Updated the PHP base images from Debian Stretch to Buster
- Updated PHP libsodium package to `1.0.17` to support `HASH_VERSION_ARGON2ID13` <a href="https://github.com/markshust/docker-magento/issues/193">#193</a>

### Added
- Built-in support for Blackfire.io
- New PHP image tags `7.2-fpm-5`, `7.3-fpm-2`

## [26.0.0] - 2019-12-30

### Added
- Ability for `src` directory to be a symlink

### Fixed
- Fixed Magento2 setup script with n98-magerun2.phar
- Fixed dev-urn-catalog-generate script

### Removed
- All Windows-specific setup and helper scripts. This involved changing directory structure of `compose` folder, there is no longer specific `magento-2` and `magento-2-windows` specific folders. Windows support works on Docker with WSL.
- Support for PHP 7.1 (EOL)

## [25.0.0] - 2019-10-22

### Added
- Full parity with [Magento Cloud PHP extensions](https://devdocs.magento.com/guides/v2.3/cloud/project/project-conf-files_magento-app.html#php-extensions)

### Updated
- Optimized Dockerfile install order and layer usage for all PHP images (7.1, 7.2 & 7.3)
- Updated few lib dependencies in Dockerfiles with new versions
- Pegged Composer to version 1.9.0 for predictability, moved to lower layer so updating version doesn't require full rebuild of all layers

## [24.2.0] - 2019-10-18

### Fixed
- Fixed logic of `bin/copyfromcontainer` and `bin/copytocontainer` so subdirectories are now properly copied from and to the container

### Added
- The `bin/fixowns` script now includes the ability to fix ownerships at the subdirectory level 
- The `bin/copyfromcontainer` and `bin/copytocontainer` scripts now fixes permissions and ownerships of just the subdirectories that are copied

## [24.1.2] - 2019-10-15

### Fixed
- Fixed `bin/copyfromcontainer` and `bin/copytocontainer` referencing incorrect destination file locations

## [24.1.1] - 2019-10-11

### Fixed
- Added missing `bin/pwa-studio` and `bin/setup-pwa-studio` bash scripts

## [24.1.0] - 2019-10-10

### Added
- Documented in README how to retrieve `bin/update` file for previous versions that did not include it
- Added `hirak/prestissimo` composer package to `bin/setup` helper script for much faster composer installs
- Downloaded archive installs are now cached on the user's machine, so subsequent installs of Magento will no longer re-download the archive if previously downloaded. Downloaded archives are stored in the `~/.docker-magento` folder.

### Fixed
- There is an invalid checksum reference in the Nexcess archive of 2.3.3, replaced checksum reference in `bin/setup` to resolve the error

### Removed
- The previous CHANGELOG for `24.0.0` referenced `vertex/module-tax` being removed but for some reason it was not removed, now it is

## [24.0.0] - 2019-10-09

### Added
- New PHP docker image version `7.3-fpm-0` for Magento 2.3.3 support
- New Elasticsearch docker image `markoshust/magento-elasticsearch:6.5.4-0` which comes bundled with icu and phonetic plugins. The initial `6.5` version is for parity with Magento Cloud.
- New `bin/update` helper script that updates your docker-magento setup to the latest version
- Added `.gitignore` file to project root to ignore `src` directory. It is recommended to keep your root docker config files in one repository, and your Magento code setup in another. This ensures the Magento base path lives at the top of one specific repository, which makes automated build pipelines and deployments easy to manage, and maintains compatibility with projects such as Magento Cloud.
- Install n98-magerun2 when setup is executed, and added related `bin/n98-magerun` and `bin/devconsole` helper scripts.
- Added `bin/setup-pwa-studio` (BETA) helper script to easily install PWA Studio, usage accepts a single parameter being the site URL you wish PWA Studio to connect to (ex. `bin/setup-pwa-studio magento2.test`)
- Added `bin/pwa-studio` (BETA) helper script to easily run the PWA Studio NodeJS web server

### Fixed
- The `bin/dev-urn-catalog-generate` helper script has been updated for compatibility with more recent versions of PHPStorm

### Removed
- The `vertex/module-tax` Composer package installs correctly as of 2.3.0, so the line within the `bin/setup` script which prevented it from being installed was removed. If one is having issues installing an older version of Magento 2, add the following line to your `composer.json` file to prevent this package from being installed:

  `{"replace": { "vertex/module-tax": "*" }}`

## [23.2.3] - 2019-07-20

### Fixed
- The `php` base Docker image changed from Debian Stretch to Buster and broke a lot of packages, which caused a failed build for `7.1-fpm-12` & `7.2-fpm-3` tags. This update pegs the `php` Docker image to Debian Stretch.

## [23.2.2] - 2019-07-17

### Fixed
- Xdebug breakpoints not triggering

### Added
- New PHP docker image versions `7.1-fpm-12`, `7.2-fpm-3`

## [23.2.1] - 2019-07-11

### Fixed
- Mailhog container doesn't stop when running bin/stop

## [23.2.0] - 2019-07-07

### Added
- View emails sent locally through Mailhog by visiting [http://{yourdomain}:8025](http://{yourdomain}:8025)

## [23.1.1] - 2019-07-01

### Updated
- Make Dockerfile consistent between versions
- Move Docker layers to bottom for smaller downloads, useful for those using previous versions
- Same Docker version tag, so just remove Docker image locally and re-pull to use

## [23.1.0] - 2019-06-27

### Added
- `libsodium-dev` package and `sodium` PHP extension for Magento 2.3.2 support.
- New PHP docker versions `7.1-fpm-10`, `7.2-fpm-1`

## [23.0.0] - 2019-04-02

### Added
- Allow setup without SSH credentials.
- Documentation for connecting to MySQL.
- `bin/status` to check container status.

### Updated
- Readme for existing installs.
- `bin/dev-urn-catalog-generate` to look at `src` folder as project root.

### Fixed
- Readme usage of pasting command into non-standard terminal.

## [22.0.0] - 2019-02-14

### Added
- Host bind mount `var/log` folder in `docker-compose.dev.yml` for debugging purposes.
- Redis is now the default storage engine for cache and session. Massively improved performance for local dev! 🚀
- Added commented-out line in `docker-compose.dev.yml` file to easily mount `auth.json` file, with updated usage in README

### Fixed
- Cron not working correctly

## [21.1.2] - 2019-02-04

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
