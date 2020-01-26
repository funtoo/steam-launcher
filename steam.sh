#!/bin/bash
service dbus start >/dev/null 2>&1

sigint_handler() {
	killall steam
	exit 0
}

id steam >/dev/null 2>&1
if [ $? -eq 1 ]; then
	echo "Creating local steam user (uid $STEAM_UID)"
	useradd -m steam --uid $STEAM_UID
	gpasswd -a steam audio
	chown -R steam:steam /home/steam
fi

# This should suppress error messages being displayed via gtk+
rm /usr/bin/zenity
ln -s /bin/true /usr/bin/zenity

# set up pulse config
install -d /etc/pulse
cat > /etc/pulse/client.conf << EOF
# Connect to the host's server using the mounted UNIX socket
default-server = ${PULSE_SERVER}

# Prevent a server running in the container
autospawn = no
daemon-binary = /bin/true

# Prevent the use of shared memory
enable-shm = false
EOF

trap sigint_handler SIGINT
while true; do
	if [ -z "$(ps --no-headers -fC steam)" ]; then
		su --login steam /usr/games/steam "$*" &
	fi
	sleep 5
done
