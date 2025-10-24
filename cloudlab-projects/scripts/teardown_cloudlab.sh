#!/usr/bin/env bash
# CloudLab teardown: remove kind clusters and prune Docker to free disk space.
# Usage:
#   ./teardown_cloudlab.sh          # safe prune
#   ./teardown_cloudlab.sh --deep   # aggressive prune (removes ALL images & volumes)

set -euo pipefail

log()  { printf "\n\033[1;36m[CloudLab]\033[0m %s\n" "$*"; }
ok()   { printf "\033[1;32m✔\033[0m %s\n" "$*"; }
warn() { printf "\033[1;33m!\033[0m %s\n" "$*"; }
err()  { printf "\033[1;31m✘\033[0m %s\n" "$*" >&2; }

DEEP="${1:-}"

is_cmd() { command -v "$1" >/dev/null 2>&1; }

show_usage() {
  cat <<EOF
Usage:
  $(basename "$0")          # safe prune (dangling layers/containers)
  $(basename "$0") --deep   # aggressive prune (ALL images, containers, volumes)
EOF
}

if [[ "${DEEP}" == "-h" || "${DEEP}" == "--help" ]]; then
  show_usage; exit 0
fi

log "Starting CloudLab teardown..."

# 1) Delete all kind clusters (if any)
if is_cmd kind; then
  clusters=$(kind get clusters || true)
  if [[ -n "${clusters}" ]]; then
    log "Deleting kind clusters..."
    while read -r c; do
      [[ -z "$c" ]] && continue
      echo " - kind delete cluster --name ${c}"
      kind delete cluster --name "${c}"
    done <<< "${clusters}"
    ok "All kind clusters removed."
  else
    ok "No kind clusters found."
  fi
else
  warn "kind not found; skipping cluster deletion."
fi

# 2) Docker prune
if is_cmd docker; then
  log "Docker engine info (before prune):"
  docker system df || true

  if [[ "${DEEP}" == "--deep" ]]; then
    warn "Running aggressive prune: removes ALL images, containers, networks, and volumes."
    docker system prune -a -f --volumes || true
    docker builder prune -a -f || true
  else
    log "Running safe prune: removes stopped containers, dangling images & cache."
    docker container prune -f || true
    docker image prune -f || true
    docker volume prune -f || true
    docker builder prune -f || true
    docker network prune -f || true
  fi

  log "Docker engine info (after prune):"
  docker system df || true
  ok "Docker cleanup completed."
else
  warn "docker not found or not connected; skipping Docker prune."
fi

# 3) Kube contexts note
if is_cmd kubectl; then
  log "Kubernetes contexts (for reference):"
  kubectl config get-contexts || true
  warn "If you want to remove kind contexts from kubeconfig manually, run:"
  echo "  kubectl config delete-context kind-cloudlab  # adjust names as needed"
  echo "  kubectl config delete-cluster kind-cloudlab  # optional"
fi

# 4) Disk usage overview
log "Disk usage overview:"
df -h / /mnt/c 2>/dev/null || df -h

ok "CloudLab teardown finished."
if [[ "${DEEP}" == "--deep" ]]; then
  warn "Deep prune done. If Docker Desktop shows high size still, restart Docker Desktop."
fi

warn "Extra reclaim (Windows PowerShell, not here in Ubuntu):"
cat <<'WINHINT'
# Close Ubuntu, then in Windows PowerShell (Admin):
wsl --shutdown
# (Optional, on newer Windows) Compact the VHDX to reclaim disk:
wsl --manage Ubuntu-24.04 --compact
WINHINT
