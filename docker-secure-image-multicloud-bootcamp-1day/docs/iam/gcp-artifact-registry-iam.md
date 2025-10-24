# GCP Artifact Registry — Least Privilege (Textbook Guide)

## Personas
- **CI_Writer**: builds and pushes images to a single repository.
- **Runtime_Reader**: pulls images only.

### Option A — Built-in Roles
- **Writer**: `roles/artifactregistry.writer`
- **Reader**: `roles/artifactregistry.reader`
*(Grant at repository scope for least privilege.)*

### Option B — Custom Role (tighter)
See `docs/iam/policies/gcp-artifactregistry-writer-custom.json`.

### Setup (Repository-level IAM)
```bash
GCP_PROJECT_ID=my-project
GCP_LOCATION=us-central1
GCP_REPO=containers

# Ensure repo exists
gcloud artifacts repositories create $GCP_REPO   --repository-format=DOCKER   --location=$GCP_LOCATION || true

# CI Service Account
gcloud iam service-accounts create ci-pusher --project $GCP_PROJECT_ID

# Grant writer at repo scope (built-in)
gcloud artifacts repositories add-iam-policy-binding $GCP_REPO   --location=$GCP_LOCATION   --member="serviceAccount:ci-pusher@$GCP_PROJECT_ID.iam.gserviceaccount.com"   --role="roles/artifactregistry.writer"
```

### GitHub OIDC (Workload Identity Federation)
```bash
POOL=github-pool
PROVIDER=github
gcloud iam workload-identity-pools create $POOL --project $GCP_PROJECT_ID --location=global
gcloud iam workload-identity-pools providers create-oidc $PROVIDER   --project $GCP_PROJECT_ID --location=global --workload-identity-pool=$POOL   --issuer-uri="https://token.actions.githubusercontent.com"   --attribute-mapping="google.subject=assertion.sub,attribute.repository=assertion.repository,attribute.ref=assertion.ref"
gcloud iam service-accounts add-iam-policy-binding ci-pusher@$GCP_PROJECT_ID.iam.gserviceaccount.com   --role roles/iam.workloadIdentityUser   --member "principalSet://iam.googleapis.com/projects/$GCP_PROJECT_ID/locations/global/workloadIdentityPools/$POOL/attribute.repository/YOUR_GITHUB_OWNER/YOUR_REPO"
```

**Workflow snippet:**
```yaml
permissions:
  id-token: write
  contents: read

steps:
  - uses: actions/checkout@v4
  - id: auth
    uses: google-github-actions/auth@v2
    with:
      workload_identity_provider: projects/${{ secrets.GCP_WIF_PROJECT_NUMBER }}/locations/global/workloadIdentityPools/github-pool/providers/github
      service_account: ci-pusher@${{ secrets.GCP_PROJECT_ID }}.iam.gserviceaccount.com
  - uses: google-github-actions/setup-gcloud@v2
  - run: gcloud auth configure-docker ${{ env.GCP_LOCATION }}-docker.pkg.dev -q
```
