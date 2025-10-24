#!/usr/bin/env bash
set -euo pipefail
mkdir -p results
if [ ! -d docker-bench-security ]; then
  git clone https://github.com/docker/docker-bench-security.git
fi
cd docker-bench-security
sudo ./docker-bench-security.sh | tee ../results/security-report.md
echo "Report written to results/security-report.md"
