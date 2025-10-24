#!/usr/bin/env bash
# CloudLab bootstrap for Ubuntu 24.04 (WSL2-friendly)
# Installs: base utils, kubectl, Terraform, AWS CLI v2, kind, helper commands
# Validates Docker (expects Docker Desktop with WSL integration enabled)

set -euo pipefail

log()  { printf "\n\033[1;36m[CloudLab]\033[0m %s\n" "$*"; }
ok()   { printf "\033[1;32m✔\033[0m %s\n" "$*"; }
warn() { printf "\033[1;33m!\033[0m %s\n" "$*"; }
err()  { printf "\033[1;31m✘\033[0m %s\n" "$*" >&2; }

is_cmd() { command -v "$1" >/dev/null 2>&1; }

detect_wsl() {
  if grep -qi microsoft /proc/version 2>/dev/null; then
    echo "true"
  else
    echo "false"
  fi
}

ensure_base() {
  log "Updating apt & installing base packages…"
  sudo apt update -y
  sudo apt upgrade -y
  sudo apt install -y         build-essential git curl unzip jq ca-certificates         apt-transport-https gnupg lsb-release software-properties-common wget
  ok "Base packages installed."
}

ensure_docker_cli() {
  # In WSL, prefer Docker Desktop engine; just ensure CLI & socket work.
  if ! is_cmd docker; then
    warn "docker CLI not found; installing Docker convenience script (may no-op on WSL)…"
    curl -fsSL https://get.docker.com | sh || true
  fi

  if groups "$USER" | grep -qw docker; then
    :
  else
    sudo usermod -aG docker "$USER" || true
    warn "Added '$USER' to 'docker' group. Open a new shell or run: newgrp docker"
  fi

  if docker version >/dev/null 2>&1; then
    ok "Docker CLI connected to engine."
  else
    warn "Docker engine not reachable yet.
    - Start Docker Desktop on Windows
    - Docker Desktop → Settings → Resources → WSL Integration → enable your distro (${WSL_DISTRO_NAME:-Ubuntu})
    - Then retry: docker version"
  fi
}

install_kubectl() {
  if is_cmd kubectl; then
    ok "kubectl already installed ($(kubectl version --client --short 2>/dev/null || echo))"
    return
  fi
  log "Installing kubectl (stable)…"
  ver="$(curl -fsSL https://dl.k8s.io/release/stable.txt)"
  curl -fsSLo kubectl "https://dl.k8s.io/release/${ver}/bin/linux/amd64/kubectl"
  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
  rm -f kubectl
  ok "kubectl ${ver} installed."
}

install_terraform() {
  if is_cmd terraform; then
    ok "Terraform already installed ($(terraform version | head -n1))"
    return
  fi
  log "Installing Terraform…"
  curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp.gpg
  echo "deb [signed-by=/usr/share/keyrings/hashicorp.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main"         | sudo tee /etc/apt/sources.list.d/hashicorp.list >/dev/null
  sudo apt update -y && sudo apt install -y terraform
  ok "Terraform installed ($(terraform version | head -n1))."
}

install_awscli() {
  if is_cmd aws; then
    ok "AWS CLI already installed ($(aws --version 2>&1))"
    return
  fi
  log "Installing AWS CLI v2…"
  tmpdir="$(mktemp -d)"
  pushd "$tmpdir" >/dev/null
  curl -fsSLo awscliv2.zip "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip"
  unzip -q awscliv2.zip
  sudo ./aws/install
  popd >/dev/null
  rm -rf "$tmpdir"
  ok "AWS CLI installed ($(aws --version 2>&1))."
}

install_kind() {
  if is_cmd kind; then
    ok "kind already installed ($(kind --version 2>/dev/null))"
    return
  fi
  log "Installing kind (Kubernetes-in-Docker)…"
  sudo curl -fsSLo /usr/local/bin/kind https://kind.sigs.k8s.io/dl/v0.23.0/kind-linux-amd64
  sudo chmod +x /usr/local/bin/kind
  ok "kind installed ($(kind --version))."
}

install_helpers() {
  log "Installing helper commands…"
  # Create cluster helper
  sudo tee /usr/local/bin/cloudlab-kind-up >/dev/null <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
CLUSTER_NAME=${1:-cloudlab}
NODE_IMAGE=${2:-kindest/node:v1.30.0}
kind create cluster --name "$CLUSTER_NAME" --image "$NODE_IMAGE"
kubectl cluster-info --context "kind-${CLUSTER_NAME}"
EOF
  sudo chmod +x /usr/local/bin/cloudlab-kind-up

  # Quick status helper
  sudo tee /usr/local/bin/cloudlab-status >/dev/null <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
echo "== Docker ==";      docker version --format '{{.Client.Version}} (client)' 2>/dev/null || docker version || true
echo; echo "== Clusters =="; kind get clusters || true
echo; echo "== Nodes ==";    kubectl get nodes -o wide || true
echo; echo "== Terraform =="; terraform version | head -n1 || true
echo; echo "== AWS CLI ==";  aws --version || true
EOF
  sudo chmod +x /usr/local/bin/cloudlab-status

  ok "Helpers installed: cloudlab-kind-up, cloudlab-status."
}

print_summary() {
  echo
  log "Bootstrap summary:"
  is_cmd docker     && docker version --format 'Docker client: {{.Client.Version}}' 2>/dev/null || true
  is_cmd kubectl    && kubectl version --client --short 2>/dev/null || true
  is_cmd terraform  && terraform version | head -n1 || true
  is_cmd aws        && aws --version || true
  is_cmd kind       && kind --version || true
  echo
  warn "If Docker says 'Cannot connect to the Docker daemon':
  - Start Docker Desktop on Windows
  - Enable WSL Integration for ${WSL_DISTRO_NAME:-your distro}
  - Then run: newgrp docker && docker version"
}

main() {
  log "Detected environment: WSL=$(detect_wsl)  Distro=${WSL_DISTRO_NAME:-unknown}"
  ensure_base
  ensure_docker_cli
  install_kubectl
  install_terraform
  install_awscli
  install_kind
  install_helpers
  print_summary
  ok "CloudLab bootstrap completed."
}

main "$@"
