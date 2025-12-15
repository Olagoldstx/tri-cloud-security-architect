<!-- BADGES:START -->

<div align="left">
[![](https://img.shields.io/github/license/Olagoldstx/tri-cloud-security-architect?style=for-the-badge&labelColor=0f172a)](https://github.com/Olagoldstx/tri-cloud-security-architect)
[![](https://img.shields.io/github/stars/Olagoldstx/tri-cloud-security-architect?style=for-the-badge&labelColor=0f172a&logo=github)](https://github.com/Olagoldstx/tri-cloud-security-architect)
[![](https://img.shields.io/github/last-commit/Olagoldstx/tri-cloud-security-architect?style=for-the-badge&labelColor=0f172a)](https://github.com/Olagoldstx/tri-cloud-security-architect)
[![](https://img.shields.io/github/issues/Olagoldstx/tri-cloud-security-architect?style=for-the-badge&labelColor=0f172a)](https://github.com/Olagoldstx/tri-cloud-security-architect)
[![](https://img.shields.io/github/issues-pr/Olagoldstx/tri-cloud-security-architect?style=for-the-badge&labelColor=0f172a)](https://github.com/Olagoldstx/tri-cloud-security-architect)
[![](https://img.shields.io/github/repo-size/Olagoldstx/tri-cloud-security-architect?style=for-the-badge&labelColor=0f172a)](https://github.com/Olagoldstx/tri-cloud-security-architect)
[![](https://img.shields.io/github/languages/top/Olagoldstx/tri-cloud-security-architect?style=for-the-badge&labelColor=0f172a)](https://github.com/Olagoldstx/tri-cloud-security-architect)
[![](https://img.shields.io/github/actions/workflow/status/Olagoldstx/tri-cloud-security-architect/ci.yml?branch=main&style=for-the-badge&labelColor=0f172a)](https://github.com/Olagoldstx/tri-cloud-security-architect)
</div>

<!-- BADGES:END -->


<p align="center">
  <img src="assets/secure-the-cloud-banner.png" alt="Secure the Cloud Banner" width="100%">
</p>

# ☁️ CloudLab Verification — Local DevSecOps Environment

> **Author:** Olakunle Paul Omoniyi  
> **Platform:** Dell XPS Ultra 9 (32 GB RAM, Intel Core Ultra 9 288V)  
> **Environment:** Windows 11 Home (WSL 2 + Ubuntu 24.04 LTS)  
> **Date:** Verified ✅ 2025-10-17  

---

## 🧠 Architecture Overview
```plaintext 
┌──────────────────────────────┐
│ Windows 11 (Home Edition) │
│ ├─ WSL 2 Subsystem Enabled │
│ ├─ Docker Desktop (WSL 2) │
│ └─ Ubuntu 24.04 LTS Distro │
│ ├─ Docker Engine CLI │
│ ├─ kind (K8s Cluster) │
│ ├─ kubectl v1.30.x │
│ ├─ Terraform v1.13.4 │
│ ├─ AWS CLI v2.31.18 │
│ └─ Utilities (git, jq) │
└──────────────────────────────┘

yaml
Copy code
This CloudLab provides a **complete local cloud-architecture sandbox** for DevSecOps,  
AWS architecture, Kubernetes security, and Terraform automation — all on one laptop.

---

## ✅ Verification Summary
| Category | Tool | Version / Output | Status |
|-----------|------|------------------|--------|
| 🪟 Windows Features | WSL 2 & VM Platform | Enabled | ✅ |
| 🐧 OS | Ubuntu 24.04 LTS on WSL 2 | `6.6.87.2-microsoft-standard-WSL2` | ✅ |
| 🐳 Container Engine | Docker Desktop (WSL 2 Backend) | Verified via `hello-world` | ✅ |
| ☸️ Kubernetes | kind (v1.30.0) + kubectl | Cluster `cloudlab-control-plane Ready` | ✅ |
| 🧱 IaC | Terraform | `Terraform v1.13.4 on linux_amd64` | ✅ |
| ☁️ Cloud SDK | AWS CLI v2 | `aws-cli/2.31.18` | ✅ |
| 🧰 Utilities | git / curl / jq / unzip | Installed via APT | ✅ |

---

## 🧾 Command Outputs (Verification Evidence)

<details><summary>Expand</summary>

### Docker
```bash
docker run --rm hello-world
Hello from Docker!
Kubernetes
bash
Copy code
kubectl get nodes -o wide
NAME                      STATUS   ROLES           AGE   VERSION
cloudlab-control-plane    Ready    control-plane   1m    v1.30.0
Terraform
bash
Copy code
terraform version
Terraform v1.13.4
on linux_amd64
AWS CLI
bash
Copy code
aws --version
aws-cli/2.31.18 Python/3.13.7 Linux/6.6.87.2-microsoft-standard-WSL2
</details>
🧰 Reproduce This Environment
1️⃣ Enable WSL 2 and VM Platform (on Windows)
powershell
Copy code
dism /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
dism /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
wsl --set-default-version 2
Reboot when prompted.

2️⃣ Install Ubuntu 24.04 and Docker Desktop
powershell
Copy code
wsl --install -d Ubuntu-24.04
Then in Docker Desktop → Settings → Resources → WSL Integration → enable Ubuntu-24.04.

3️⃣ Provision Toolchain in Ubuntu
bash
Copy code
sudo apt update && sudo apt upgrade -y
sudo apt install -y build-essential git curl unzip jq ca-certificates apt-transport-https gnupg lsb-release wget
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker $USER
newgrp docker
4️⃣ Install kubectl + Terraform + AWS CLI + kind
(Already verified in this environment; see scripts/bootstrap_cloudlab.sh for automation.)

⚡ Day-1 Test Checklist
Test	Command	Expected Result
Docker Engine	docker run --rm hello-world	Prints “Hello from Docker!”
kind Cluster	cloudlab-kind-up	Creates cluster successfully
Kubernetes	kubectl get nodes	Node = Ready
Terraform	terraform version	v1.13.4
AWS CLI	aws --version	v2.31.18
Git + jq	git --version && jq --version	Versions printed

🧩 Next Steps
🧱 Create Terraform lab projects inside ~/cloudlab/projects/terraform/

☁️ Configure AWS credentials with aws configure

🔒 Begin Kubernetes security labs (Network Policies, RBAC, PodSecurity)

💾 Commit this README to GitHub → olagoldstx/cloudlab-projects

🎓 Tag this milestone: v1.0 – CloudLab Bootstrap Verified

💡 Notes
Hyper-V is not needed on Windows Home (WSL 2 handles virtualization).

Keep ≈ 15–20 GB free on C: for Docker layers and kind images.

To back up your environment:

powershell
Copy code
wsl --export Ubuntu-24.04 C:\Backups\Ubuntu24.tar
Re-import later:

powershell
Copy code
wsl --import Ubuntu-24.04 C:\WSL\Ubuntu24 C:\Backups\Ubuntu24.tar
✅ Environment Status: Fully Operational
CloudLab (WSL 2 + Docker + Kubernetes + Terraform + AWS CLI) verified 2025-10-17.

