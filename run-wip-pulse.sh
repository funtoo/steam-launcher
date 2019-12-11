#!/bin/bash
xhost +local:
exec nvidia-docker run \
	-ti \
	--name steam-nvidia-${USER} \
	-e DISPLAY=$DISPLAY \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /dev/shm:/dev/shm \
	--privileged \
	-v /run/user/${UID}/pulse:/run/user/1000/pulse \
	-e PULSE_SERVER=unix:/run/user/1000/pulse/native \
	funtoo/steam-nvidia-ubuntu18:1.1
