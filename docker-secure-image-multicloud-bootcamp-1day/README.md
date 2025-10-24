# Docker Secure Image — **1‑Day Multi‑Cloud Security Bootcamp**

> **Goal:** In one intensive day, you’ll build a production‑grade Docker image for a tiny web app, harden it with defense‑in‑depth controls, produce an SBOM, scan it, sign it, and push it to AWS ECR, GCP Artifact Registry, and Azure ACR — with textbook‑style guidance and `nano`-friendly steps.

**Audience:** Beginner → Advanced (security‑heavy)

**Outcome:** A GitHub project you can demo in interviews and reuse in real environments.

---

## 📦 What You’ll Build Today (High‑Level)
- A minimal Python/Flask app in a **multi‑stage** Docker build
- **Non‑root**, read‑only filesystem, least‑privilege **capabilities** and `no-new-privileges`
- Custom **seccomp** and **AppArmor/SELinux** profiles
- **CIS Docker Benchmark** and **policy checks** (OPA/Rego)
- **SBOM** (Syft) and **Vulnerability Scans** (Trivy/Grype — Trivy used here)
- **Image Signing** (Cosign; keyless-ready via GitHub OIDC or local key pair)
- **Multi‑cloud push**: AWS ECR, GCP Artifact Registry, Azure ACR
- GitHub Actions CI pipeline to automate build → scan → SBOM → sign

⚠️ *No cloud credentials are included. You’ll use your own IAM principals with least privilege.*

---

## 🗂 Repository Layout
```
docker-secure-image-multicloud-bootcamp-1day/
├─ app/
│  ├─ main.py
│  └─ requirements.txt
├─ Dockerfile
├─ .dockerignore
├─ .gitignore
├─ Makefile
├─ docker-compose.dev.yml
├─ security/
│  ├─ seccomp.json
│  ├─ apparmor-profile
│  └─ selinux-container.te
├─ policies/
│  ├─ docker.rego
│  └─ hadolint.yaml
├─ scripts/
│  ├─ scan_trivy.sh
│  ├─ generate_sbom_syft.sh
│  ├─ sign_cosign.sh
│  ├─ docker_bench.sh
│  └─ enforce_policies.sh
├─ .github/workflows/ci.yml
├─ LICENSE
└─ README.md  (this file)
```
---

## 🧰 Prereqs (Local)
- Docker 24+
- `nano` editor (Ubuntu: `sudo apt-get update && sudo apt-get install -y nano`)
- Optional: `trivy`, `syft`, `cosign`, `opa` (scripts will guide installs on Linux)
- Python 3.11+ (for local testing), `make`

---

## 🧑‍💻 Day Plan (Approximate)
1. **Hour 1** – App & Dockerfile (multi‑stage, tiny attack surface)
2. **Hour 2** – Hardening: non‑root, RO filesystem, seccomp/AppArmor/SELinux
3. **Hour 3** – SBOM (Syft) + Vulnerability scanning (Trivy)
4. **Hour 4** – Policy as Code (OPA): forbid risky Dockerfile patterns
5. **Hour 5** – Image signing (Cosign), provenance & attestations (intro)
6. **Hour 6** – Multi‑Cloud registry pushes (ECR, Artifact Registry, ACR)
7. **Hour 7** – GitHub Actions CI (build→scan→SBOM→sign)
8. **Hour 8** – Wrap‑up: CIS checks, checklist, next steps

Each section has **copy‑paste** steps you can run in `nano` and terminal.

---

## 1) Create the App (Beginner → Secure by Default)

Open the file in **nano**:
```bash
nano app/main.py
```
Paste:
```python
from flask import Flask
import os

app = Flask(__name__)

@app.get("/")
def hello():
    return {"message": "Hello, secure Docker world!", "env": os.environ.get("APP_ENV","prod")}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
```

Dependencies:
```bash
nano app/requirements.txt
```
Paste:
```
flask==3.0.3
gunicorn==22.0.0
```
Why Gunicorn? It’s a proper WSGI server (prod‑ready) unlike Flask dev server.

---

## 2) Multi‑Stage Dockerfile (Small, Non‑Root, Read‑Only)

```bash
nano Dockerfile
```
Paste:
```dockerfile
# ---- build stage ----
FROM python:3.12-slim AS build

ENV PYTHONDONTWRITEBYTECODE=1     PYTHONUNBUFFERED=1

# Add system deps for building wheels
RUN apt-get update && apt-get install -y --no-install-recommends     build-essential ca-certificates  && rm -rf /var/lib/apt/lists/*

WORKDIR /wheels
COPY app/requirements.txt ./
RUN pip wheel --no-cache-dir --wheel-dir /wheels -r requirements.txt

# ---- runtime stage ----
FROM gcr.io/distroless/python3-debian12:nonroot

# Labels for provenance and traceability
LABEL org.opencontainers.image.source="https://github.com/you/docker-secure-image-multicloud-bootcamp-1day"       org.opencontainers.image.description="Secure Flask example with defense-in-depth"       org.opencontainers.image.licenses="Apache-2.0"

# Distroless already runs as nonroot by default; create work dir owned by nonroot
WORKDIR /app

# Copy app + wheels from builder
COPY --from=build /wheels /wheels
COPY app/ /app/

# Install from wheels (pip is available in this distroless image via launcher)
# If your distroless variant lacks pip, consider using a slim runtime base with venv.
# Here we leverage python entrypoint directly:
ENV PYTHONPATH=/app
ENV APP_ENV=prod

# Security hardening flags (enforced at runtime via docker run / compose / k8s):
# - run as non-root (image default)
# - read-only root fs
# - drop capabilities, no-new-privileges, seccomp/apparmor
# - expose non-privileged port
EXPOSE 8080

# Gunicorn serves Flask app; bind to :8080
CMD ["/usr/bin/python3", "-m", "gunicorn", "-w", "2", "-b", "0.0.0.0:8080", "main:app"]
```

**Why distroless?** Smaller attack surface (no package manager or shell).

**If you need a shell for debugging**, switch runtime base to `python:3.12-slim` and keep a non‑root user:
```dockerfile
RUN useradd -u 10001 -m appuser
USER 10001:10001
```

Build & test:
```bash
make build
make run  # then curl http://127.0.0.1:8080/
```

---

## 3) Runtime Hardening (Docker flags)

Use **least privilege** at runtime:
```bash
# Read-only root filesystem; tmpfs for writable dirs; drop caps; seccomp; apparmor
docker run --rm -p 8080:8080 \
  --read-only \
  --tmpfs /tmp \
  --security-opt no-new-privileges \
  --cap-drop=ALL \
  --seccomp=security/seccomp.json \
  --security-opt apparmor=secure-flask \
  docker-secure-image-multicloud-bootcamp-1day:latest
```

**SELinux users (Fedora/RHEL):** See `security/selinux-container.te` to compile a confined type.

For dev convenience, you can use `docker-compose.dev.yml` which applies safe defaults.

---

## 4) SBOM & Vulnerability Scanning

Generate SBOM (Syft) and scan (Trivy):
```bash
make sbom     # outputs sbom.spdx.json
make scan     # prints vulnerabilities and saves results/trivy.json
```

**Tip:** Fail the build if high/critical vulns are found (see `scripts/scan_trivy.sh`).

---

## 5) Policy as Code (OPA/Rego)

Block risky patterns (e.g., root user, `latest` tags, missing healthcheck) with:
```bash
make policy
```
Adjust rules in `policies/docker.rego` to match your org’s standards.

---

## 6) Sign the Image (Cosign)

Locally with a key pair:
```bash
make cosign-key   # generates cosign.key / cosign.pub
make sign         # signs the local image
make verify       # verifies signature
```

**Keyless (CI):** GitHub Actions can use OIDC to sign without keys. See `.github/workflows/ci.yml` (commented sections).

---

## 7) Push to Multi‑Cloud Registries

Set environment variables and login with least‑privilege identities. Examples:

**AWS ECR**
```bash
export AWS_REGION=us-east-1
export ECR_ACCOUNT_ID=123456789012
export ECR_REPO=secure-flask
make ecr-login
make ecr-push
```

**GCP Artifact Registry**
```bash
export GCP_LOCATION=us-central1
export GCP_PROJECT_ID=my-project
export GCP_REPO=containers
make gcp-login
make gcp-push
```

**Azure ACR**
```bash
export ACR_NAME=mysecureacr
make acr-login
make acr-push
```

Each push target signs and (optionally) re‑scans server‑side depending on your cloud configuration.

---


---

### IAM: Least-Privilege Guides
- [AWS ECR](docs/iam/aws-ecr-iam.md)
- [GCP Artifact Registry](docs/iam/gcp-artifact-registry-iam.md)
- [Azure ACR](docs/iam/azure-acr-iam.md)

> Each guide includes **nano-friendly** JSON/YAML and step-by-step CLI to create roles, bind least-privilege permissions, and enable **GitHub OIDC** so your CI can push without long‑lived secrets.

## 8) CI Pipeline (GitHub Actions)

- Build image on PR
- Run Trivy scan (fail on HIGH/CRITICAL)
- Generate and upload SBOM artifact
- Cosign sign image on `main` (keyless-ready via OIDC)
- Optionally push to cloud registries on tagged releases

See: `.github/workflows/ci.yml`

---

## 9) CIS Docker Benchmark & Extras

Run benchmark (informational):
```bash
make cis
```
Fix findings iteratively (daemon and host configs vary by environment).

**Extras to Explore**
- SLSA provenance & in‑toto attestations
- Admission controls (Kyverno/Gatekeeper) to enforce signatures & SBOMs
- Runtime threat detection (Falco / eBPF‑based tools)

---

## ✅ Security Checklist (Pre‑Deployment)

- [ ] Multi‑stage build produces **small** runtime
- [ ] **Non‑root** user; `no-new-privileges`; **read‑only** root FS
- [ ] **Drop ALL** capabilities; add none unless justified
- [ ] **Seccomp** + **AppArmor/SELinux** profile loaded
- [ ] **HEALTHCHECK** present (consider adding to Dockerfile or Compose)
- [ ] **Secrets** not baked into image; use runtime secret managers
- [ ] **SBOM** generated; **scan** is clean of HIGH/CRITICAL or managed with exceptions
- [ ] **Image signed** (Cosign); verification path documented
- [ ] **Policies** pass (OPA, hadolint)
- [ ] Pushed to **ECR / Artifact Registry / ACR** with **least‑privilege** IAM

---

## 📝 `nano` Tips for This Project
- `nano README.md` → paste any section then **Ctrl+O** to save, **Enter**, **Ctrl+X** to exit
- Use `nano -l Dockerfile` to show line numbers
- **Search:** `Ctrl+W`, type phrase, **Enter**
- **Multi‑paste:** Middle‑click or Shift+Insert in most terminals

---

## License
Apache-2.0


---

### Bonus: Alpine Secure Build
Use the alternate `Dockerfile.alpine` plus hardened runtime flags to learn tradeoffs vs Distroless.
```bash
make build-alpine
make run-alpine
make sbom-alpine
make scan-alpine
make sign-alpine
make compare
```

### Kubernetes Policy Gate (Kyverno)
Block unsafe workloads and enforce signatures:
```bash
make kyverno-apply   # applies k8s/kyverno/*.yaml
```
> Edit `verify-signed-images.yaml` to paste your **Cosign public key**.

### Runtime Threat Detection (Falco)
See `docs/lessons/lab-falco.md` to run Falco locally and trigger rules.

### CIS Docker Benchmark Auto-Report
```bash
make bench-report
```
Outputs to `results/security-report.md`.
