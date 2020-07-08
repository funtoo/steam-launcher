#!/bin/bash
VERSION="$(cat VERSION)"
docker image build -t funtoo/steam-nvidia-ubuntu18:$VERSION .
