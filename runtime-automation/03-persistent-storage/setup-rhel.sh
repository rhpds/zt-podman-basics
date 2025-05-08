#!/bin/sh
echo "Starting module called 03-persistent-storage" >> /tmp/progress.log
pushd /tmp
sudo -u rhel podman stop -a
sudo -u rhel podman rm -a
popd