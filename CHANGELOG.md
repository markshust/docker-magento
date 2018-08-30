# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

- New PHP 7.2 image is now available on the dev tag. Please report any issues.

## [16.2.0] - 2018-08-29
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
