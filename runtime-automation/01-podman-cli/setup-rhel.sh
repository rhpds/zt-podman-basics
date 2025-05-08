#!/bin/sh
echo "Starting module called 01-podman-cli" >> /tmp/progress.log
pushd /tmp
sudo -u rhel podman run -d --name=default-httpd docker.io/httpd
popd