#!/bin/sh
echo "Validating module-02 (stub)" >> /tmp/progress.log

# Phase 1 stub — exits 0 to allow navigation during environment development.
# Real validation will confirm:
#   - registry.lab.local/python-hostinfo present in local image cache
#   - registry.lab.local/ubi9 present in local image cache
#   - 'hostinfo' short tag absent (removed in last step of module)

echo "PASS: module-02 stub validation" >> /tmp/progress.log
exit 0
