#!/bin/sh
echo "Solving module-03 (stub)" >> /tmp/progress.log

# Phase 1 stub — real commands added after environment verification.
# Participant commands in this module involve interactive sessions that
# cannot be scripted exactly; solve script will approximate with non-interactive
# equivalents:
#   podman run --rm registry.lab.local/python-hostinfo whoami
#   podman run --rm registry.lab.local/python-hostinfo id
#   podman run --rm registry.lab.local/python-hostinfo df -hP
#   podman run --rm registry.lab.local/python-hostinfo ps aux
#   podman run --rm registry.lab.local/python-hostinfo cat /tmp/myfile.txt (expected error)
#   podman run --rm registry.lab.local/python-hostinfo /bin/bash -c "echo 'test data' > /tmp/myfile.txt && cat /tmp/myfile.txt"
#   podman run --rm registry.lab.local/python-hostinfo cat /tmp/myfile.txt (expected error again)
#   podman ps -a

echo "Solved module-03" >> /tmp/progress.log
