# Scanservice

Scan
- udev and dbus are running locally in the container
- udev starts or restarts scanbd whenever the scanner is connected or powered on
- scanbd initiates the processing script upon detection of a button press on the scanner

Processing
- scans are processed by scripts in /script (color correction, drop empty pages, OCR, PDF creation)
- unprocessed scans (/dest/scan.\*) and done documents (/dest/*.pdf) are saved in /dest
- unprocessed scans (/dest/scan.\*) are resumed on every start from /dest

# Docker Compose
Find all possible and recommended settings in the attached [docker-compose.yml](docker-compose.yml) 

# Truenas Settings
Find a screenshot of the APP settings here: [truenas_settings.png](docs/truenas_settings.png)

Setting UID / GID is optional but recommended. You'll find the UID (GID is the same) in the users setting: [truenas_find_uid.png](docs/truenas_find_uid.png)

# Buttons

| Button + Function | Purpose                                           | Duplex | Mode*    | dpi | Processing |
|-------------------|---------------------------------------------------|--------|----------|-----|------------|
| scan 1            | Douple-Sided Document (b/w) / OCR                 | Duplex | Lineart  | 300 | PDF+OCR    |
| scan 2            | Douple-Sided Document with image (halftone) / OCR | Duplex | Halftone | 300 | PDF+OCR    |
| scan 3            | Douple-Sided Photo (grayscale)                    | Duplex | Gray     | 300 | PDF        |
| scan 4            | Douple-Sided Document with image (color) / OCR    | Duplex | Color    | 150 | PDF+OCR    |
| scan 5            | Single-Sided Document (b/w) / OCR                 | Front  | Lineart  | 300 | PDF+OCR    |
| scan 6            | Single-Sided Document with image (halftone) / OCR | Front  | Halftone | 300 | PDF+OCR    |
| scan 7            | Single-Sided Photo (grayscale)                    | Front  | Gray     | 300 | PDF        |
| scan 8            | Single-Sided Photo (color)                        | Front  | Color    | 300 | PDF        |
| scan 9            | Single-Sided HiRes Photo (color) / Trimmed        | Front  | Color    | 600 | PDF+TRIM   |

\* Modes
- Lineart: --emphasis 0 --contrast 50 --brightness 0
- Halftone: --ht-type Dither --ht-pattern 2
- Gray: --emphasis 0 --contrast 20 --brightness 20
- Color: --emphasis 0 --contrast 35 --brightness 35

# Toolchain
Interfacing
- udev
- dbus
- scanbd
- saned

Organization
- task-spooler
- parallel

Processing
- imagemagick
- ghostscript
- tesseract (AI)

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
