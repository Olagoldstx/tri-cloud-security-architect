# Lesson 05 — Secrets Handling

**Never** bake secrets into images. Use:
- Docker secrets (Swarm) or `--secret` build-time mounts
- AWS Secrets Manager / GCP Secret Manager / Azure Key Vault at runtime
- Kubernetes secrets with sealed-secrets or external secret operators

Build-time secret example (BuildKit):
```bash
DOCKER_BUILDKIT=1 docker build   --secret id=git_token,src=$HOME/.git-credentials   -t app:secret .
```
