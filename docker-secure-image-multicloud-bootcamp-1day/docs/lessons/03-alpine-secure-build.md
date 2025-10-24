# Lesson 03 — Alpine Secure Build (Professor Track)

> 👨‍🏫 **Professor’s Note:** Alpine is tiny and pragmatic. For production security, we still enforce non-root, read-only FS, dropped capabilities, and strict seccomp/AppArmor. Your goal is to minimize attack surface without sacrificing operability.

## Goals
- Multi-stage Alpine build with Python virtualenv copied to minimal runtime
- Non-root, least-privilege runtime
- Hardened runtime flags and profiles
- SBOM + scan + sign, then compare against the Distroless build

## Steps
1. Open the Alpine Dockerfile:
   ```bash
   nano Dockerfile.alpine
   ```
2. Build:
   ```bash
   make build-alpine
   ```
3. Run with hardening:
   ```bash
   make run-alpine
   ```
4. SBOM + scan + sign:
   ```bash
   make sbom-alpine
   make scan-alpine
   make sign-alpine
   ```
5. Compare:
   ```bash
   make compare
   ```

## Debrief
- Distroless removes shell → reduces attack surface; Alpine retains shell → easier troubleshooting.
- Security posture improves most from **non-root + read-only + seccomp + AppArmor + cap-drop** regardless of base image.
