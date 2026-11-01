#!/bin/bash

set -eou pipefail

# if .ssh dir exists
if [ -d "${HOME}/.ssh" ]; then
  echo "[SKIP] Not generating ssh key-pair (used for e.g. GitHub access), because .ssh dir exists"
  exit 0
fi

ssh-keygen
