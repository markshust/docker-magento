# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [14.0.1] - 2018-07-28

### Fixed
- Magento 2.2.5 requires username and password to be different values. Updated to dummy "John Smith" user persona with username `john.smith` and password `password123`.

## [14.0.0] - 2018-07-21

### Added
- New `dev/auth.json` file used instead of `~/.composer/auth.json` file, so each project can have different auth credentials.

### Changed
- The `cron` service is now disabled by default. This services uses higher CPU and should probably only be enabled when working on cron-related tasks (or on production).
