#!/usr/bin/env bash
set -euo pipefail

IMAGE_ALPINE=${1:-secure-alpine-flask:latest}
IMAGE_DISTROLESS=${2:-docker-secure-image-multicloud-bootcamp-1day:latest}

echo "[1/5] Build Alpine image"
docker build -f Dockerfile.alpine -t "$IMAGE_ALPINE" .

echo "[2/5] Run Alpine (hardened)"
docker run --rm -p 8080:8080 \
  --read-only \
  --tmpfs /tmp \
  --security-opt no-new-privileges \
  --cap-drop=ALL \
  --seccomp=security/seccomp.json \
  --security-opt apparmor=secure-flask \
  "$IMAGE_ALPINE" &
PID=$!
sleep 2 || true
echo "Sample request:"
curl -s http://127.0.0.1:8080/ || true
docker stop $(docker ps -q --filter ancestor="$IMAGE_ALPINE") 2>/dev/null || true

echo "[3/5] SBOM + Scan"
bash scripts/generate_sbom_syft.sh "$IMAGE_ALPINE" || true
bash scripts/scan_trivy.sh "$IMAGE_ALPINE" || true

echo "[4/5] Optional signing"
bash scripts/sign_cosign.sh "$IMAGE_ALPINE" || true

echo "[5/5] Compare image sizes"
printf "\n%-35s %-12s %s\n" "REPOSITORY" "TAG" "SIZE"
docker images --format '{{.Repository}} {{.Tag}} {{.Size}}' | awk '{printf "%-35s %-12s %s\n", $1, $2, $3}' | grep -E "(secure-alpine-flask|docker-secure-image-multicloud-bootcamp-1day)"
