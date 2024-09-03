# 📦 itzteajay-glitch/wpe2k changelog

[![conventional commits](https://img.shields.io/badge/conventional%20commits-1.0.0-yellow.svg)](https://conventionalcommits.org)
[![semantic versioning](https://img.shields.io/badge/semantic%20versioning-2.0.0-green.svg)](https://semver.org)

> All notable changes to this project will be documented in this file

## [1.0.53](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.52...v1.0.53) (2024-09-03)


### 🐛 Bug Fixes

* included additional output for the summary page. ([25907ce](https://github.com/itzteajay-glitch/wpe2k/commit/25907ce64bd909c897c377562243de29b8b260a1))

## [1.0.52](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.51...v1.0.52) (2024-09-03)


### 🐛 Bug Fixes

* added timeouts to every job ([6edb9ea](https://github.com/itzteajay-glitch/wpe2k/commit/6edb9ea815c5c7d5be780edd48352289bf1b3305))
* modifying run step for the gh release body pull to see if I can make it work. ([6389252](https://github.com/itzteajay-glitch/wpe2k/commit/6389252b2991c1e14448c1bf3670752d8264ad51))

## [1.0.51](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.50...v1.0.51) (2024-09-03)


### 🐛 Bug Fixes

* syntax error with variables in release job ([5fadb02](https://github.com/itzteajay-glitch/wpe2k/commit/5fadb0276a3f90c3b0355b7e72a5fa201516af36))

## [1.0.50](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.49...v1.0.50) (2024-09-03)


### 🐛 Bug Fixes

* slimmed down unneeded fields from the release and simplified passing variables. ([920c6da](https://github.com/itzteajay-glitch/wpe2k/commit/920c6da64c33de4ad29c447da77490ee9ff6c666))

## [1.0.49](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.48...v1.0.49) (2024-09-03)


### 🐛 Bug Fixes

* adjusted step source for release-tag to point back to the semantic-release step. ([35873da](https://github.com/itzteajay-glitch/wpe2k/commit/35873da479eed07b53688d02f4bb75950282a395))

## [1.0.48](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.47...v1.0.48) (2024-09-03)


### 🐛 Bug Fixes

* streamlined env variables and data passing between jobs even further. Now each job has an identical step to pass data where commands formatted neatly ([37681e9](https://github.com/itzteajay-glitch/wpe2k/commit/37681e996d209c634dcac99e87995d2ff32f13cb))

## [1.0.47](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.46...v1.0.47) (2024-09-03)


### 🐛 Bug Fixes

* further streamlined variable passing for env variables to make it easier to manage and read. Fixed broken version number in package files. ([ecebf9b](https://github.com/itzteajay-glitch/wpe2k/commit/ecebf9bf59c0248033c17a5436ab6a21dde72381))

## [1.0.46](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.45...v1.0.46) (2024-09-03)


### 🐛 Bug Fixes

* ensure consistency when passing release-version and release-tag through the jobs ([ff36306](https://github.com/itzteajay-glitch/wpe2k/commit/ff363066818d147864bb1a06cbd4521fbef34730))

## [1.0.45](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.44...v1.0.45) (2024-09-03)


### 🐛 Bug Fixes

* added release version and email to env variables to ensure debchange warnings were eliminated ([aed66c9](https://github.com/itzteajay-glitch/wpe2k/commit/aed66c9cf63ff61d6a54256bf200c9e7b809b337))
* env varaible for RELEASE_VERSION fixed. ([acad95f](https://github.com/itzteajay-glitch/wpe2k/commit/acad95f72f308febfc30e1a0d0a81f2fa20cf2fe))

## [1.0.44](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.43...v1.0.44) (2024-09-03)


### 🐛 Bug Fixes

* changed directory in the before-build-hook path to move into the source-dir ([2f37af8](https://github.com/itzteajay-glitch/wpe2k/commit/2f37af88d4cb7facf536e80ff992e99cf99bf1de))

## [1.0.43](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.42...v1.0.43) (2024-09-03)


### 🐛 Bug Fixes

* modifying build package and release job to include updating the debian changelog file ([0f619c2](https://github.com/itzteajay-glitch/wpe2k/commit/0f619c2fbba81710450d650569c4dcfe2a669778))

## [1.0.42](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.41...v1.0.42) (2024-09-03)


### 🐛 Bug Fixes

* working on making debchange command function ([d0035b4](https://github.com/itzteajay-glitch/wpe2k/commit/d0035b49e225a218468e1b846606d53fc6f41375))

## [1.0.41](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.40...v1.0.41) (2024-09-03)


### 🐛 Bug Fixes

* moved GH_TOKEN to the update debian changelog step ([dc89896](https://github.com/itzteajay-glitch/wpe2k/commit/dc898969c80c0adc1d7495bc4f65b468cd82a66d))

## [1.0.40](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.39...v1.0.40) (2024-09-03)


### 🐛 Bug Fixes

* add gh token for getting the gh commit ([f8ddd89](https://github.com/itzteajay-glitch/wpe2k/commit/f8ddd89c3b8b44d22146fe8013818df26c51608d))

## [1.0.39](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.38...v1.0.39) (2024-09-03)


### 🐛 Bug Fixes

* Testing pipeline ([3be7fa2](https://github.com/itzteajay-glitch/wpe2k/commit/3be7fa2ff032c00035ab7050e72e10dbc47654fd))

## [1.0.38](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.37...v1.0.38) (2024-09-02)


### 🐛 Bug Fixes

* removed double >> loading the GITHUB_OUTPUT var. ([afab37f](https://github.com/itzteajay-glitch/wpe2k/commit/afab37f99fd470c16ab37db01061579ff55f0eb7))

## [1.0.37](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.36...v1.0.37) (2024-09-02)


### 🐛 Bug Fixes

* made adjustments to the if statements and their namings to make it more obvious where build failed. ([dd7ce0e](https://github.com/itzteajay-glitch/wpe2k/commit/dd7ce0e5d23775eb4851d1f46b7c4470668a19da))

## [1.0.36](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.35...v1.0.36) (2024-09-02)


### 🐛 Bug Fixes

* syntax issue in one of the if statements. ([f9d2426](https://github.com/itzteajay-glitch/wpe2k/commit/f9d2426bf6faf111e8b5e02f926c0afed7c0568b))

## [1.0.35](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.34...v1.0.35) (2024-09-02)


### 🐛 Bug Fixes

* debugging passing of variables from job to job in github actions ([8810522](https://github.com/itzteajay-glitch/wpe2k/commit/881052283cdacb1b950051644398b16589cdb43e))

## [1.0.34](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.33...v1.0.34) (2024-09-02)


### 🐛 Bug Fixes

* Attempting to echo the final release version in the last job ([9c6dac7](https://github.com/itzteajay-glitch/wpe2k/commit/9c6dac71fd6d7a9a4e8f3b429c51df8032f2d859))

## [1.0.33](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.32...v1.0.33) (2024-09-02)


### 🐛 Bug Fixes

* debugging release pipeline. Focus currently on exporting version into release files ([8b2e06a](https://github.com/itzteajay-glitch/wpe2k/commit/8b2e06abfe63ff1c177dfab485b478ba70fffd95))

## [1.0.32](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.31...v1.0.32) (2024-09-02)


### 🐛 Bug Fixes

* leveraging outputs to fill env variables in different jobs ([c3821bf](https://github.com/itzteajay-glitch/wpe2k/commit/c3821bf536bea4b8b03773484acf26aac25fde4e))

## [1.0.31](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.30...v1.0.31) (2024-09-02)


### 🐛 Bug Fixes

* adjusted syntaxing to account for the way variables are called in the new structure. ([b2f2dcd](https://github.com/itzteajay-glitch/wpe2k/commit/b2f2dcd7f65348adb9605debe1c8a8f55c135e2c))

## [1.0.30](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.29...v1.0.30) (2024-09-02)


### 🐛 Bug Fixes

* moved env variable into final build ([29496e7](https://github.com/itzteajay-glitch/wpe2k/commit/29496e742c8fb621f6a60d49e3400d61c748f0bc))

## [1.0.29](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.28...v1.0.29) (2024-09-02)


### 🐛 Bug Fixes

* Adjusted step names and fixed syntaxing in release.yml ([1e6903a](https://github.com/itzteajay-glitch/wpe2k/commit/1e6903ad6a69c3abb4778b0f4b9331db5d9753e1))

## [1.0.28](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.27...v1.0.28) (2024-09-02)


### 🐛 Bug Fixes

* adjusted the verification to exit 0 if no new version available. ([9cb5848](https://github.com/itzteajay-glitch/wpe2k/commit/9cb5848eae8b6f82475fdee61a1af4fc96367464))

## [1.0.27](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.26...v1.0.27) (2024-09-02)


### 🐛 Bug Fixes

* fixed broken sintax in the SKIP_BUILD var ([eb8c0b4](https://github.com/itzteajay-glitch/wpe2k/commit/eb8c0b4a7e3851ea365cd8f611d3c04565a1ad09))

## [1.0.26](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.25...v1.0.26) (2024-09-02)


### 🐛 Bug Fixes

* Added checks to see if new version was created. ([83cbb7d](https://github.com/itzteajay-glitch/wpe2k/commit/83cbb7dc5948b3bc3e8adcc4ff11c2e2a5e2ac55))
* made changes to check if new version is available. Also slimmed down debugging since I've had some success. ([49eaedf](https://github.com/itzteajay-glitch/wpe2k/commit/49eaedf833f0991519000c606c04ed0019b0b65e))

## [1.0.25](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.24...v1.0.25) (2024-09-02)


### 🐛 Bug Fixes

* required to push fixes to test out release build ([a341ac6](https://github.com/itzteajay-glitch/wpe2k/commit/a341ac669138b1fd799d14bf8e3239462373a90a))

## [1.0.24](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.23...v1.0.24) (2024-09-02)


### 🐛 Bug Fixes

* added the same var from the gh release upload into the file name to hopefully pull version into the file name ([06f48ea](https://github.com/itzteajay-glitch/wpe2k/commit/06f48ea67d11e74c5faeb01189b36de11afefdee))

## [1.0.23](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.22...v1.0.23) (2024-09-02)


### 🐛 Bug Fixes

* fine tuned pathing for the file copy. Also fixed the github path for the release upload command. ([b4a4e2c](https://github.com/itzteajay-glitch/wpe2k/commit/b4a4e2c0941dccabdbc16bcdf2f0d28d87facb44))

## [1.0.22](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.21...v1.0.22) (2024-09-02)


### 🐛 Bug Fixes

* added full paths where appropriate ([8a70dfe](https://github.com/itzteajay-glitch/wpe2k/commit/8a70dfecd09cfff9483a9c7486b016f28e6727a0))

## [1.0.21](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.20...v1.0.21) (2024-09-02)


### 🐛 Bug Fixes

* last attempt for the night. ([537c387](https://github.com/itzteajay-glitch/wpe2k/commit/537c38793c147455edce4c7df0cfd4e664e61f3b))
* Last attempt for the night. ([c237f1c](https://github.com/itzteajay-glitch/wpe2k/commit/c237f1c6a105ce219e3ce6663d6903f1b6d078cc))

## [1.0.20](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.19...v1.0.20) (2024-09-02)


### 🐛 Bug Fixes

* attempting to fix syntaxing issue ([73331ba](https://github.com/itzteajay-glitch/wpe2k/commit/73331ba0429eac0882cdf92ee3af42fe5eaa3c79))
* checking indentation issue ([7d991e1](https://github.com/itzteajay-glitch/wpe2k/commit/7d991e15d086306d992319a9f342d35b8479e39f))
* downloaded files from the proper job this time. ([af6ff70](https://github.com/itzteajay-glitch/wpe2k/commit/af6ff7013f3f83dacfdf933bb7dd298181d1361c))
* syntaxing issue in release.yml ([9910bad](https://github.com/itzteajay-glitch/wpe2k/commit/9910bad0ab1835fdce0731773723a3f0c56f47a8))
* testing build out ([6795fa6](https://github.com/itzteajay-glitch/wpe2k/commit/6795fa6af7bd1f910a1eb0ab5acbf85570d3bf01))
* testing syntaxing problem ([9827f37](https://github.com/itzteajay-glitch/wpe2k/commit/9827f37946f82537711707a5c4083dca9d4a2566))

## [1.0.19](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.18...v1.0.19) (2024-09-02)


### 🐛 Bug Fixes

* compressed the release files to move them into another job. ([0924ae7](https://github.com/itzteajay-glitch/wpe2k/commit/0924ae74a89e5a15432e2b0cb3dde92b4ca07e4e))

## [1.0.18](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.17...v1.0.18) (2024-09-02)


### 🐛 Bug Fixes

* included even more debugging to understand why files aren't being created. ([c3b6a04](https://github.com/itzteajay-glitch/wpe2k/commit/c3b6a04f91c2c95b2e84ce2d3c9fb091ef635634))

## [1.0.17](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.16...v1.0.17) (2024-09-02)


### 🐛 Bug Fixes

* used actions/upload and download to perserve the new release files between jobs. ([cf319ff](https://github.com/itzteajay-glitch/wpe2k/commit/cf319ff583c25f7ece7c141300f51e43153413d0))

## [1.0.16](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.15...v1.0.16) (2024-09-02)


### 🐛 Bug Fixes

* adjusting release.yml to facilitate proper build out. ([62b5a63](https://github.com/itzteajay-glitch/wpe2k/commit/62b5a63789beef7213b5d06b6f9522540ad6a655))

## [1.0.15](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.14...v1.0.15) (2024-09-02)


### 🐛 Bug Fixes

* testing build structure since it seems like the directory was not surviving between jobs ([b59b08b](https://github.com/itzteajay-glitch/wpe2k/commit/b59b08b198ed725dba1a33cb28dd1a6ccb864ec0))

## [1.0.14](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.13...v1.0.14) (2024-09-02)


### 🐛 Bug Fixes

* added some debugging messages to release.yml ([15b08c3](https://github.com/itzteajay-glitch/wpe2k/commit/15b08c3e50ed495f7d0821d37d9703dd71cf3d39))

## [1.0.13](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.12...v1.0.13) (2024-09-02)


### 🐛 Bug Fixes

* corrected switch for mkdir command in release.yml ([299393c](https://github.com/itzteajay-glitch/wpe2k/commit/299393c3dfaf3be0843ba64d474cbd9a6b4742d7))

## [1.0.12](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.11...v1.0.12) (2024-09-02)


### 🐛 Bug Fixes

* Corrected syntax error in release.yml ([4b6c711](https://github.com/itzteajay-glitch/wpe2k/commit/4b6c711cbeccc7fdd1c5f7aa95efbb6ed4c4940a))
* fixed the mkdir command and also simplified job names ([dd47304](https://github.com/itzteajay-glitch/wpe2k/commit/dd47304d346183905883934d916b37717c188c59))

## [1.0.11](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.10...v1.0.11) (2024-09-02)


### 🐛 Bug Fixes

* added a third job and shuffled build and release jobs ([54e3a4f](https://github.com/itzteajay-glitch/wpe2k/commit/54e3a4f3d498e97180d67bd5785f00b9f5682ba0))

## [1.0.10](https://github.com/itzteajay-glitch/wpe2k/compare/v1.0.9...v1.0.10) (2024-09-02)


### 🐛 Bug Fixes

* bypassing need for root to mv files by performing a copy with new names instead. ([29f08a2](https://github.com/itzteajay-glitch/wpe2k/commit/29f08a24fffc42007f09562e39a8bcbd58fc17ea))

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
