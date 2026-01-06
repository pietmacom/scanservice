# Scanservice

Scan
- udev and dbus are running locally in the container
- udev starts or restarts scanbd whenever the scanner is connected or powered on
- scanbd initiates the processing script upon detection of a button press on the scanner

Processing
- scans are processed by scripts in /script (drop empty pages, color correction, OCR, PDF creation)
- unprocessed scans (/dest/scan.\*) and done documents (/dest/*.pdf) are saved in /dest
- unprocessed scans (/dest/scan.\*) are resumed on every start from /dest

# Docker Compose
Find all possible and recommended settings in the attached [docker-compose.yml](docker-compose.yml) 

# Truenas Settings
Find a screenshot of the APP settings here: [truenas_settings.png](docs/truenas_settings.png)

Setting UID / GID is optional but recommended. You'll find the UID (GID is the same) in the users setting: [truenas_find_uid.png](docs/truenas_find_uid.png)

# References
- https://linuxconfig.org/tutorial-on-how-to-write-basic-udev-rules-in-linux
- https://github.com/budney/docker-scanbd/blob/main/Dockerfile
- https://gitlab.com/sane-project/frontend/scanbd
- https://wiki.archlinux.org/title/Scanner_Button_Daemon
- https://www.devhide.com/scanbd-doesn-t-work-unless-i-restart-it-from-the-command-line-30755637
- https://sourceforge.net/p/scanbd/code/HEAD/tree/
- https://git.launchpad.net/ubuntu/+source/scanbd/tree/
- https://forum.archlinux.de/d/20954-tasten-am-scanner-nutzen-mit-scanbd
- https://wiki.ubuntuusers.de/scanbd/
