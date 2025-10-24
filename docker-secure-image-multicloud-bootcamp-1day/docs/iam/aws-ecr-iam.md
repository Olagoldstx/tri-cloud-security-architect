# AWS ECR — Least Privilege (Textbook Guide)

## Personas
- **CI_Pusher**: builds and pushes images to one ECR repo.
- **Runtime_Puller**: pulls images only.
- **Scanner**: lists and inspects images/metadata (read-only).

### 1) Policies (JSON)
- `docs/iam/policies/aws-ecr-ci-push.json` — minimal push perms for CI.
- `docs/iam/policies/aws-ecr-readonly-pull.json` — minimal pull for runtime.
- `docs/iam/policies/aws-ecr-scanner.json` — read-only for scanners.
- `docs/iam/policies/aws-github-oidc-trust.json` — example role trust for GitHub OIDC (keyless).

> **Scope to a single repo:** replace `"Resource": "*"` with:
> `arn:aws:ecr:REGION:ACCOUNT_ID:repository/REPO_NAME`

### 2) Create IAM role + attach policy (CLI)
```bash
AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
AWS_REGION=us-east-1
REPO=secure-flask

# Create policy
aws iam create-policy   --policy-name ECR-CI-Push-Min   --policy-document file://docs/iam/policies/aws-ecr-ci-push.json

# Create role with OIDC trust (edit file first: account id, repo, branch)
nano docs/iam/policies/aws-github-oidc-trust.json
aws iam create-role   --role-name ecr-ci-push-role   --assume-role-policy-document file://docs/iam/policies/aws-github-oidc-trust.json

# Attach policy
aws iam attach-role-policy   --role-name ecr-ci-push-role   --policy-arn arn:aws:iam::$AWS_ACCOUNT_ID:policy/ECR-CI-Push-Min
```

**Reader role (runtime pullers)**
```bash
aws iam create-policy   --policy-name ECR-ReadOnly-Pull   --policy-document file://docs/iam/policies/aws-ecr-readonly-pull.json
aws iam create-role   --role-name ecr-runtime-pull-role   --assume-role-policy-document file://trust-your-runtime.json   # e.g., EKS IRSA or EC2 instance profile
aws iam attach-role-policy   --role-name ecr-runtime-pull-role   --policy-arn arn:aws:iam::$AWS_ACCOUNT_ID:policy/ECR-ReadOnly-Pull
```

### 3) GitHub Actions OIDC to assume role
```yaml
permissions:
  id-token: write
  contents: read

env:
  AWS_REGION: us-east-1
  ECR_ACCOUNT_ID: ${{ secrets.AWS_ACCOUNT_ID }}
  ECR_REPO: secure-flask

steps:
  - uses: actions/checkout@v4
  - uses: aws-actions/configure-aws-credentials@v4
    with:
      role-to-assume: arn:aws:iam::${{ secrets.AWS_ACCOUNT_ID }}:role/ecr-ci-push-role
      aws-region: ${{ env.AWS_REGION }}
```
