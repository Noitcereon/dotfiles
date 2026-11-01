#!/bin/bash

set -eou pipefail

echo "Executing $0"

# if .ssh dir exists
SSH_DIR="${HOME}/.ssh"
if [ -d ${SSH_DIR} ]; then
  echo "[SKIP] Not generating ssh key-pair (used for e.g. GitHub access), because .ssh dir (${SSH_DIR}) already exists"
  exit 0
fi

ssh-keygen

