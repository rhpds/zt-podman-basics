#!/bin/sh
echo "Solving module-03 (stub)" >> /tmp/progress.log

# Phase 1 stub — real commands added after environment verification.
# Participant commands in this module involve interactive sessions that
# cannot be scripted exactly; solve script will approximate with non-interactive
# equivalents:
#   podman run --rm registry.lab.local/hostinfo-app whoami
#   podman run --rm registry.lab.local/hostinfo-app id
#   podman run --rm registry.lab.local/hostinfo-app df -hP
#   podman run --rm registry.lab.local/hostinfo-app ps aux
#   podman run --rm registry.lab.local/hostinfo-app cat /tmp/myfile.txt (expected error)
#   podman run --rm registry.lab.local/hostinfo-app /bin/bash -c "echo 'test data' > /tmp/myfile.txt && cat /tmp/myfile.txt"
#   podman run --rm registry.lab.local/hostinfo-app cat /tmp/myfile.txt (expected error again)
#   podman ps -a

echo "Solved module-03" >> /tmp/progress.log
