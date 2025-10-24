#!/usr/bin/env bash
set -euo pipefail
IMAGE="${1:-docker-secure-image-multicloud-bootcamp-1day:latest}"
if ! command -v syft >/dev/null 2>&1; then
  echo "Installing Syft (Linux x86_64)..." >&2
  curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sudo sh -s -- -b /usr/local/bin
fi
syft "$IMAGE" -o spdx-json=sbom.spdx.json
echo "SBOM written to sbom.spdx.json"
