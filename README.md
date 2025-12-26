# Scanservice

- udev and dbus are running locally in the container
- scanbd is started and restarted by udev when the scanner is connected or turned on
- scans are processed by scripts (OCR, drop empty pages, color correction, PDF creation)
- done documents and unprocessed scans are located in /dest
- processing is done in /work
- unprocessed scannes are resumed on every start

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