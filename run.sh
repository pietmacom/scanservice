#!/bin/bash -ex

# UDEV ACCESSING HOSTS DBUS
DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket unshare --net /lib/systemd/systemd-udevd --daemon 

# DBUS
dbus-uuidgen > /var/lib/dbus/machine-id
mkdir -p /var/run/dbus
dbus-daemon --config-file=/usr/share/dbus-1/system.conf --print-address

# udevadm trigger

# PREPARE WORKER
chmod -R 777 /dest
chmod -R 777 /work
su -s /bin/bash -c "/script/my-resume.script" - saned

# LOGS
echo -n > /var/log/scanbd.log
/script/scanbd.script start
tail -f /var/log/scanbd.log
