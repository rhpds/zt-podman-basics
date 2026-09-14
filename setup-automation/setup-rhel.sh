#!/bin/bash
set -x
trap 'echo "FATAL: setup failed at line ${LINENO}" >> /tmp/progress.log; exit 1' ERR

echo "Adding wheel" > /root/post-run.log
usermod -aG wheel rhel

echo "Setup zt-podman-basics" > /tmp/progress.log
chmod 666 /tmp/progress.log

dnf -y remove katello-ca-consumer-* 2>/dev/null || true
subscription-manager clean
subscription-manager register --activationkey="${ACTIVATION_KEY}" --org="${ORG_ID}" --force
dnf install -y git podman skopeo

LIBDIR=/tmp/lab-lib-$$
git clone --depth=1 https://github.com/rhel-labs/lab-setup "${LIBDIR}"
. "${LIBDIR}/common.sh"

echo "Packages installed" >> /tmp/progress.log

# --- lab configuration ---
REGISTRY_HOST="registry-${GUID}.${DOMAIN}"
# -------------------------

setup_ssl_registry "${REGISTRY_HOST}"
echo "Registry up at ${REGISTRY_HOST}" >> /tmp/progress.log

# Mirror python-hostinfo to the local registry
podman pull ghcr.io/rhel-labs/python-hostinfo:latest
podman tag ghcr.io/rhel-labs/python-hostinfo:latest "${REGISTRY_HOST}/python-hostinfo:latest"
podman push "${REGISTRY_HOST}/python-hostinfo:latest"
podman rmi ghcr.io/rhel-labs/python-hostinfo:latest
podman rmi "${REGISTRY_HOST}/python-hostinfo:latest"
echo "python-hostinfo mirrored to local registry" >> /tmp/progress.log

# Pull ubi9 into root storage but do NOT push to the local registry —
# students mirror it as a tagging exercise in Module 2
podman pull registry.access.redhat.com/ubi9/ubi:latest
echo "ubi9 staged in root storage for Module 2 exercise" >> /tmp/progress.log

add_local_host "${REGISTRY_HOST}"

persist_env_var REGISTRY "${REGISTRY_HOST}"

cleanup_subscription
cleanup_certbot
cleanup_tmpfiles
echo "Setup complete" >> /tmp/progress.log
