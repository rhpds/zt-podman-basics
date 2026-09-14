#!/bin/sh
echo "Solving module-02 (stub)" >> /tmp/progress.log

# Phase 1 stub — real commands added after environment verification.
# Participant commands in this module:
#   skopeo inspect docker://registry.lab.local/python-hostinfo | grep -A2 ExposedPorts
#   podman pull registry.lab.local/python-hostinfo
#   podman pull registry.lab.local/ubi9
#   podman images
#   podman inspect registry.lab.local/python-hostinfo | grep -A2 ExposedPorts
#   podman history registry.lab.local/python-hostinfo
#   podman tag registry.lab.local/python-hostinfo hostinfo
#   podman tag registry.lab.local/ubi9 ubi9
#   podman images
#   podman rmi hostinfo

echo "Solved module-02" >> /tmp/progress.log
