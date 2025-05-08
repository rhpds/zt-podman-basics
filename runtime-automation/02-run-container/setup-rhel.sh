#!/bin/sh
echo "Starting module called 02-run-container" >> /tmp/progress.log
pushd /tmp
sudo -u rhel podman stop -a
sudo -u rhel podman rm -a
popd