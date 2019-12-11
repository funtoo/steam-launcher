# steam-launcher
Funtoo's Docker-based Steam launcher

## Usage

See https://www.funtoo.org/Steam for usage instructions.

## Release Notes

### 1.4

Release 1.4 contains a new Docker container image. To use this launcher, the steam launcher will download and create a new
container. You will need to re-download your Steam games.

Changes:

* New Docker container image creates a Steam user with the same uid as the current user, rather than hard-coded 1000.
* All Steam data will be peristently stored outside the container in ~/SteamData in your home directory. This will allow
  it to persist in the future even if the Docker container image is upgraded.
* Improvements to sound initialization; PulseAudio appears to be functioning reliably now.

### 1.3 (Initial Release)
