# Scanservice

Scan
- udev and dbus are running locally in the container
- scanbd is started and restarted by udev when the scanner is connected or turned on

Processing
- scans are processed by scripts (OCR, drop empty pages, color correction, PDF creation)
- unprocessed scans and done documents are located in /dest
- unprocessed scans are resumed on every start

# Truenas Settings
Find a screenshot of the APP settings here: https://github.com/pietmacom/scanservice/blob/main/docs/truenas_settings.png
Setting UID / GID is optional but recommended. You'll find the UID (GID is the same) in the users setting: https://github.com/pietmacom/scanservice/blob/main/docs/truenas_find_uid.png

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
