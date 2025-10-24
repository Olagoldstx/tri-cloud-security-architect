# Docker Security Masterclass — Multi‑Cloud Edition (Professor Version)
**Author:** Olakunle Paul Omoniyi  •  **GitHub:** https://github.com/Olagoldstx  
**Date:** October 19, 2025

> 👨🏾‍🏫 **Professor’s Note:** This is a complete one‑day intensive that takes you from *Dockerfile → hardened runtime → signed images → policy‑gated Kubernetes* across AWS, GCP, and Azure. Learn the *why* behind each control and prove it with labs.

---

## 🎯 Learning Outcomes
- Build secure images with **Distroless** and **Alpine** (multi‑stage, tiny, least privilege).
- Enforce **non‑root**, **read‑only**, **no‑new‑privileges**, **cap‑drop**, **seccomp**, **AppArmor**.
- Generate **SBOM** (Syft), **scan** (Trivy), **sign** (Cosign), and **verify**.
- Push to **ECR**, **Artifact Registry**, and **ACR** with **OIDC keyless** CI.
- Gate workloads with **Kyverno** and detect anomalies with **Falco**.
- Map configurations to **CIS Docker Benchmark**, **NIST 800‑190**, **ISO 27001**.

---

## 🗺️ One‑Day Professor Schedule (8 Hours)

**Hour 1 — Foundations**
- Read: `docs/lessons/06-namespace-isolation.md`
- Diagram: `diagrams/docker-architecture.mmd`
- Lab: `make build && make run` (then `curl :8080/`)

**Hour 2 — Hardened Runtime**
- Read: `docs/lessons/07-capabilities-seccomp.md`
- Lab: run with `--read-only --tmpfs /tmp --cap-drop=ALL --security-opt no-new-privileges`
- Apply `security/seccomp.json` and AppArmor profile

**Hour 3 — Alpine vs Distroless**
- Read: `docs/lessons/03-alpine-secure-build.md`
- Lab: `make build-alpine && make run-alpine && make compare`
- Quiz: `docs/lessons/quiz-alpine.md`

**Hour 4 — SBOM, Scanning, Signing**
- Read: `docs/lessons/09-supply-chain-security.md`
- Labs: `make sbom && make scan && make sign && make verify`

**Hour 5 — Policy as Code**
- Kyverno intro & examples in README + `k8s/kyverno/`
- Lab: `make kyverno-apply` (paste your Cosign pubkey into `verify-signed-images.yaml`)

**Hour 6 — Multi‑Cloud IAM & Push**
- Read: `docs/iam/aws-ecr-iam.md`, `docs/iam/gcp-artifact-registry-iam.md`, `docs/iam/azure-acr-iam.md`
- Lab: choose one cloud and push (`make ecr-push` / `gcp-push` / `acr-push`)

**Hour 7 — Runtime Threat Detection**
- Read: `docs/lessons/08-runtime-threat-detection.md`
- Lab: `docs/lessons/lab-falco.md`

**Hour 8 — Compliance & Wrap‑up**
- Run: `make bench-report` → see `results/security-report.md`
- Read: `docs/lessons/10-compliance-cis-nist.md`
- Deliverables checklist below

---

## 📚 Core Study Materials
- **Slides:** [`docker-security-masterclass-slides.pptx`](docker-security-masterclass-slides.pptx)
- **Anki Deck:** [`docker-security-masterclass-anki.csv`](docker-security-masterclass-anki.csv)
- **Lessons:** `docs/lessons/` (10 modules)  
- **IAM Packs:** `docs/iam/` (AWS/GCP/Azure least‑privilege)  
- **K8s Policies:** `k8s/kyverno/` (non‑root, verifyImages)  
- **Security Profiles:** `security/` (seccomp, AppArmor, SELinux)

---

## ☸️ Kyverno — Definition & Use
**Kyverno** is a *Kubernetes‑native policy engine* to **validate**, **mutate**, **generate**, and **verify** resources using plain YAML.  
- Enforce non‑root, forbid `:latest`, require resource limits.  
- Verify only **Cosign‑signed images** can run (`verifyImages`).  
- Automate secure defaults (mutate securityContext).

Apply the included policies:
```bash
make kyverno-apply
# Then deploy a test Pod and observe admission results
```

---

## ☸️ EKS / GKE / AKS — Definitions
- **EKS (AWS Elastic Kubernetes Service):** Managed Kubernetes on AWS; integrates IAM (IRSA), VPC, ECR, GuardDuty, KMS.  
- **GKE (Google Kubernetes Engine):** Managed Kubernetes on GCP; integrates Workload Identity Federation and Artifact Registry.  
- **AKS (Azure Kubernetes Service):** Managed Kubernetes on Azure; integrates Managed Identity, ACR, Defender for Cloud.

---

## 🧪 Labs — Copy/Paste Friendly
```bash
make build && make run
make sbom && make scan && make sign && make verify
make build-alpine && make run-alpine && make compare
make kyverno-apply
make bench-report
```

---

## ✅ Deliverables Checklist
- [ ] Screenshot: `cosign verify` output
- [ ] Artifact: `sbom.spdx.json`
- [ ] Report: `results/trivy.json` and `results/security-report.md`
- [ ] Push proof: image tagged/pushed to one registry
- [ ] Kyverno admission: signed image allowed, unsigned rejected
- [ ] Falco detection log captured

---

## 🧾 License & Attribution
Apache‑2.0 © 2025 Olakunle Paul Omoniyi
