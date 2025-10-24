#!/usr/bin/env bash
set -euo pipefail
if [ ! -d docker-bench-security ]; then
  git clone https://github.com/docker/docker-bench-security.git
fi
cd docker-bench-security
sudo ./docker-bench-security.sh
