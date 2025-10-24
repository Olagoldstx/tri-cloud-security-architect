# Lesson 04 — Docker Content Trust & Provenance

- Enable DCT:
  ```bash
  export DOCKER_CONTENT_TRUST=1
  docker pull alpine:3.20
  ```
- Understand Notary v2 direction and how this complements **Cosign** signing used in CI.
- Prefer Cosign for OCI-native signatures and OIDC keyless workflows.
