# 📦 itzteajay-glitch/wpe2k changelog

[![conventional commits](https://img.shields.io/badge/conventional%20commits-1.0.0-yellow.svg)](https://conventionalcommits.org)
[![semantic versioning](https://img.shields.io/badge/semantic%20versioning-2.0.0-green.svg)](https://semver.org)

> All notable changes to this project will be documented in this file

## [1.0.9](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.8...v1.0.9) (2024-09-02)


### 🐛 Bug Fixes

* added proper pathing before forloop to ensure the files are looped through properly while getting renamed. ([78bcc4d](https://github.com/itzteajay-glitch/wpe2k/commit/78bcc4d62f1f3f7a4117efe40ad8d4af9d4d24c2))

## [1.0.8](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.7...v1.0.8) (2024-09-02)


### 🐛 Bug Fixes

* Adjusted pipeline ordering for jobs ([8f1f00d](https://github.com/itzteajay-glitch/wpe2k/commit/8f1f00d150fdc6b10edfaedad8b2be5cf92a6dc0))
* Modified release.yml to rename release files to proper version before adding them to the releas. ([2df044f](https://github.com/itzteajay-glitch/wpe2k/commit/2df044fb64e3be1ce6ddd6f933993ef86ff95aa2))
* updated install file to point to all scripts. Also added file name manipulation to release.yml in hopes I can get the proper version number in the release files. ([d606ea2](https://github.com/itzteajay-glitch/wpe2k/commit/d606ea28801be3f97532bd58c7a2cc20865c85a1))

## [1.0.7](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.6...v1.0.7) (2024-09-02)


### 🐛 Bug Fixes

* added install file to deb directory. Also prepped to set up alpha and beta branches for pre-release releases. ([e9fdf7d](https://github.com/itzteajay-glitch/wpe2k/commit/e9fdf7d45643104df09998e6fd91c362cd6c09ee))
* adjusted the system file generated fo the install script to work properly after deb install. ([c9cc40a](https://github.com/itzteajay-glitch/wpe2k/commit/c9cc40a899cf1bf696bec6bedaaa5d46c977ac4b))
* Attempting to migrate the change log during the build. ([1430a70](https://github.com/itzteajay-glitch/wpe2k/commit/1430a706d796499f39872c132b766ddd7ae30505))
* attempting to replicate the changelog from semantic-release into the debian directory ([6a5b82c](https://github.com/itzteajay-glitch/wpe2k/commit/6a5b82c6f2ea0168eb95c81568a0b583bccdcb74))
* changing mv to cp to see if that works. ([00d8e4c](https://github.com/itzteajay-glitch/wpe2k/commit/00d8e4c42afd346b550951494309d1203ef5f330))
* created placeholder changelog and updated release.yml ([2c87122](https://github.com/itzteajay-glitch/wpe2k/commit/2c87122e42e0d5dd3214aabb1364c1ef57ac7e4f))
* Created placeholder for changelog in debian directory and updated the release.yml fild ([d6c879f](https://github.com/itzteajay-glitch/wpe2k/commit/d6c879f48372e99e1698636ba120a290a932ff19))
* First official beta release with working deb package. ([4f807a0](https://github.com/itzteajay-glitch/wpe2k/commit/4f807a0bf382c615e3c24186490bffe7ec51c374))
* Fixed issue where the main script was not properly creating the service. ([4e27570](https://github.com/itzteajay-glitch/wpe2k/commit/4e275703bcfb66aac686e4d5f4158ffe11c8d3ae))
* Initial beta release with installable deb package. ([883c164](https://github.com/itzteajay-glitch/wpe2k/commit/883c164f5c22ed016c9cf934258fe0af899b1f2b))
* Initial beta release with installable deb package. ([f99e1d7](https://github.com/itzteajay-glitch/wpe2k/commit/f99e1d7fb205bc38e00d24b9773a64c7985cba28))
* Promoting beta to main ([46d1787](https://github.com/itzteajay-glitch/wpe2k/commit/46d1787196b9e7109cbc41e8c06492330496e68e))
* seeing what I can do with sh inside of the release.yml ([6ebbb5b](https://github.com/itzteajay-glitch/wpe2k/commit/6ebbb5bef390af951f45c28906f74236d85f33b9))
* Set up repo with a beta branch wich should allow me to push pre-release releases. ([53287fa](https://github.com/itzteajay-glitch/wpe2k/commit/53287faf08695697cffedc1920982079dd09b9ba))
* testing release set up for beta branch. This should flag the release as a pre-release. ([b75937c](https://github.com/itzteajay-glitch/wpe2k/commit/b75937cc0236a843831f397ff1f3b2352355106b))
* testing to see if the syntax of on will work for multiple methods depending on branch. ([aabba1e](https://github.com/itzteajay-glitch/wpe2k/commit/aabba1efd19d543e8eae69cf0f805b3ed7cad4fb))
* Updated release.yml to include main branch pushes to trigger release. ([ca521b4](https://github.com/itzteajay-glitch/wpe2k/commit/ca521b402a3d65a5c181b7173a5a3dc220d8d9d6))

## [1.0.7-beta.11](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.7-beta.10...v1.0.7-beta.11) (2024-09-02)


### 🐛 Bug Fixes

* adjusted the system file generated fo the install script to work properly after deb install. ([c9cc40a](https://github.com/itzteajay-glitch/wpe2k/commit/c9cc40a899cf1bf696bec6bedaaa5d46c977ac4b))

## [1.0.7-beta.10](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.7-beta.9...v1.0.7-beta.10) (2024-09-02)


### 🐛 Bug Fixes

* First official beta release with working deb package. ([4f807a0](https://github.com/itzteajay-glitch/wpe2k/commit/4f807a0bf382c615e3c24186490bffe7ec51c374))

## [1.0.7-beta.9](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.7-beta.8...v1.0.7-beta.9) (2024-09-02)


### 🐛 Bug Fixes

* Initial beta release with installable deb package. ([883c164](https://github.com/itzteajay-glitch/wpe2k/commit/883c164f5c22ed016c9cf934258fe0af899b1f2b))

## [1.0.7-beta.8](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.7-beta.7...v1.0.7-beta.8) (2024-09-02)


### 🐛 Bug Fixes

* Initial beta release with installable deb package. ([f99e1d7](https://github.com/itzteajay-glitch/wpe2k/commit/f99e1d7fb205bc38e00d24b9773a64c7985cba28))

## [1.0.7-beta.7](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.7-beta.6...v1.0.7-beta.7) (2024-09-02)


### 🐛 Bug Fixes

* Created placeholder for changelog in debian directory and updated the release.yml fild ([d6c879f](https://github.com/itzteajay-glitch/wpe2k/commit/d6c879f48372e99e1698636ba120a290a932ff19))

## [1.0.7-beta.6](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.7-beta.5...v1.0.7-beta.6) (2024-09-02)


### 🐛 Bug Fixes

* created placeholder changelog and updated release.yml ([2c87122](https://github.com/itzteajay-glitch/wpe2k/commit/2c87122e42e0d5dd3214aabb1364c1ef57ac7e4f))

## [1.0.7-beta.5](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.7-beta.4...v1.0.7-beta.5) (2024-09-02)


### 🐛 Bug Fixes

* seeing what I can do with sh inside of the release.yml ([6ebbb5b](https://github.com/itzteajay-glitch/wpe2k/commit/6ebbb5bef390af951f45c28906f74236d85f33b9))

## [1.0.7-beta.4](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.7-beta.3...v1.0.7-beta.4) (2024-09-02)


### 🐛 Bug Fixes

* Attempting to migrate the change log during the build. ([1430a70](https://github.com/itzteajay-glitch/wpe2k/commit/1430a706d796499f39872c132b766ddd7ae30505))

## [1.0.7-beta.3](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.7-beta.2...v1.0.7-beta.3) (2024-09-02)


### 🐛 Bug Fixes

* changing mv to cp to see if that works. ([00d8e4c](https://github.com/itzteajay-glitch/wpe2k/commit/00d8e4c42afd346b550951494309d1203ef5f330))

## [1.0.7-beta.2](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.7-beta.1...v1.0.7-beta.2) (2024-09-02)


### 🐛 Bug Fixes

* attempting to replicate the changelog from semantic-release into the debian directory ([6a5b82c](https://github.com/itzteajay-glitch/wpe2k/commit/6a5b82c6f2ea0168eb95c81568a0b583bccdcb74))

## [1.0.7-beta.1](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.6...v1.0.7-beta.1) (2024-09-02)


### 🐛 Bug Fixes

* added install file to deb directory. Also prepped to set up alpha and beta branches for pre-release releases. ([e9fdf7d](https://github.com/itzteajay-glitch/wpe2k/commit/e9fdf7d45643104df09998e6fd91c362cd6c09ee))
* Set up repo with a beta branch wich should allow me to push pre-release releases. ([53287fa](https://github.com/itzteajay-glitch/wpe2k/commit/53287faf08695697cffedc1920982079dd09b9ba))
* testing release set up for beta branch. This should flag the release as a pre-release. ([b75937c](https://github.com/itzteajay-glitch/wpe2k/commit/b75937cc0236a843831f397ff1f3b2352355106b))
* testing to see if the syntax of on will work for multiple methods depending on branch. ([aabba1e](https://github.com/itzteajay-glitch/wpe2k/commit/aabba1efd19d543e8eae69cf0f805b3ed7cad4fb))

## [1.0.6](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.5...v1.0.6) (2024-09-02)


### 🐛 Bug Fixes

* added /* to include all the files built in the relase upload. ([2672786](https://github.com/itzteajay-glitch/wpe2k/commit/267278677004260a0dd0d5e4b72393701f17cdbe))

## [1.0.5](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.4...v1.0.5) (2024-09-02)


### 🐛 Bug Fixes

* created an overwrite of the artifacts directory in the release.yml file for automatic builds. ([1bc8edf](https://github.com/itzteajay-glitch/wpe2k/commit/1bc8edf576940ee3a2c6d43156799e3fe6f0fe17))

## [1.0.4](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.3...v1.0.4) (2024-09-02)


### 🐛 Bug Fixes

* fixed paths in release.yml to hopefully populate the build files into the release. ([9624e14](https://github.com/itzteajay-glitch/wpe2k/commit/9624e14abe1ddb030764986bdce7078ae3b910bd))

## [1.0.3](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.2...v1.0.3) (2024-09-02)


### 🐛 Bug Fixes

* Updated the github runner file to point to the right directory which should result in populated files in the release. ([0fd59ed](https://github.com/itzteajay-glitch/wpe2k/commit/0fd59edf2450efff94a75f5e260562ad07e7babb))

## [1.0.2](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.1...v1.0.2) (2024-09-02)


### 🐛 Bug Fixes

* This should result in a deb file being produced in the release. ([6b5a091](https://github.com/itzteajay-glitch/wpe2k/commit/6b5a091e804ae92d7e489f8565b3861c93403eb4))

## [1.0.1](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.0...v1.0.1) (2024-09-02)


### 🐛 Bug Fixes

* **pencil:** making build dependant on release. ([6eed15f](https://github.com/itzteajay-glitch/wpe2k/commit/6eed15f2cd6de606915ea3823b3558bbf21c1f7f))

## 1.0.0 (2024-09-02)


### 🐛 Bug Fixes

* **pencil:** fix sytax of action yml ([f95310c](https://github.com/itzteajay-glitch/wpe2k/commit/f95310c4bb28fbe5f18ff572458ac93c4fec283a))
