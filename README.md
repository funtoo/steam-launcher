# steam-launcher
Funtoo's Docker-based Steam launcher

## Usage

See https://www.funtoo.org/Steam for usage instructions.

## Release Notes

### 1.6

Release 1.6 contains a new Docker container image, but will utilize your already-installed games without needing to
redownload.

Changes:
* FL-6947: fix PulseAudio (audio) so it works again inside Steam.

### 1.5

Release 1.5 contains a new Docker container image. If upgrading from 1.4, you will *not* need to re-download your games
or reinstall Steam. It will use your existing ~/SteamData directory.

Changes:

* Disable zenity (the gtk+ dialog pop-up) to avoid annoying pop-ups when Steam first launches.
* FL-6907: fix hard-coding of pulseaudio config for UID 1000 so it will work with all host user UIDs.

### 1.4

Release 1.4 contains a new Docker container image. To use this launcher, the steam launcher will download and create a new
container. You will need to re-download your Steam games.

Changes:

* New Docker container image creates a Steam user with the same uid as the current user, rather than hard-coded 1000.
* All Steam data will be peristently stored outside the container in ~/SteamData in your home directory. This will allow
  it to persist in the future even if the Docker container image is upgraded.
* Improvements to sound initialization; PulseAudio appears to be functioning reliably now.

### 1.3 (Initial Release)
