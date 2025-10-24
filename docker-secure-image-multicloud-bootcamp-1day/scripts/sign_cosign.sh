#!/usr/bin/env bash
set -euo pipefail
IMAGE="${1:-docker-secure-image-multicloud-bootcamp-1day:latest}"
if ! command -v cosign >/dev/null 2>&1; then
  echo "Installing Cosign..." >&2
  curl -sSfL https://raw.githubusercontent.com/sigstore/cosign/main/install.sh | sudo sh -s -- -b /usr/local/bin
fi

if [ ! -f cosign.key ]; then
  echo "Generating cosign key pair..."
  cosign generate-key-pair
fi
cosign sign --key cosign.key "$IMAGE"
cosign verify --key cosign.pub "$IMAGE"
