#!/bin/bash -ex

# SET USER ID
if [ -n "${UID}" ];
then
	usermod --uid ${UID} saned
fi

# SET GROUP ID
if [ -n "${GID}" ];
then
	groupmod --gid ${GID} saned
fi

# UDEV ACCESSING HOSTS DBUS
DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket unshare --net /lib/systemd/systemd-udevd --daemon 

# DBUS
dbus-uuidgen > /var/lib/dbus/machine-id
mkdir -p /var/run/dbus
dbus-daemon --config-file=/usr/share/dbus-1/system.conf --print-address

# udevadm trigger

# PREPARE WORKER
chmod -R 777 /dest || true
chmod -R 777 /work || true
su -s /bin/bash -c "/script/my-resume.script" - saned

# LOGS
echo -n > /var/log/scanbd.log
/script/scanbd.script start
tail -f /var/log/scanbd.log
