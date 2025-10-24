#!/usr/bin/env bash
set -euo pipefail
IMAGE="${1:-docker-secure-image-multicloud-bootcamp-1day:latest}"
mkdir -p results
if ! command -v trivy >/dev/null 2>&1; then
  echo "Installing Trivy (Linux x86_64)..." >&2
  curl -sL https://github.com/aquasecurity/trivy/releases/latest/download/trivy_0.54.1_Linux-64bit.tar.gz | tar -zx
  sudo mv trivy /usr/local/bin/
fi
trivy image --format json --output results/trivy.json --severity HIGH,CRITICAL "$IMAGE"
trivy_exit=$?
echo "Trivy exit code: $trivy_exit"
exit $trivy_exit
