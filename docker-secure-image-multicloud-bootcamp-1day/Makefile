IMAGE=docker-secure-image-multicloud-bootcamp-1day:latest

.PHONY: build run stop clean scan sbom policy cosign-key sign verify ecr-login ecr-push gcp-login gcp-push acr-login acr-push cis

build:
	docker build -t $(IMAGE) .

run:
	docker run --rm -p 8080:8080 \	  --read-only \	  --tmpfs /tmp \	  --security-opt no-new-privileges \	  --cap-drop=ALL \	  --seccomp=security/seccomp.json \	  --security-opt apparmor=secure-flask \	  $(IMAGE)

stop:
	@docker ps -q --filter ancestor=$(IMAGE) | xargs -r docker stop

clean:
	docker rmi -f $(IMAGE) || true
	rm -rf results sbom.* cosign.key cosign.pub

scan:
	bash scripts/scan_trivy.sh $(IMAGE)

sbom:
	bash scripts/generate_sbom_syft.sh $(IMAGE)

policy:
	bash scripts/enforce_policies.sh

cosign-key:
	@if [ ! -f cosign.key ]; then cosign generate-key-pair; else echo "cosign.key exists"; fi

sign:
	bash scripts/sign_cosign.sh $(IMAGE)

verify:
	cosign verify --key cosign.pub $(IMAGE)

# ---------- AWS ECR ----------
ecr-login:
	@aws --version >/dev/null 2>&1 || (echo "Install AWS CLI"; exit 1)
	@if [ -z "$$AWS_REGION" ] || [ -z "$$ECR_ACCOUNT_ID" ] || [ -z "$$ECR_REPO" ]; then echo "Set AWS_REGION, ECR_ACCOUNT_ID, ECR_REPO"; exit 1; fi
	aws ecr get-login-password --region $$AWS_REGION | docker login --username AWS --password-stdin $$ECR_ACCOUNT_ID.dkr.ecr.$$AWS_REGION.amazonaws.com
	@aws ecr describe-repositories --repository-names $$ECR_REPO --region $$AWS_REGION >/dev/null 2>&1 || aws ecr create-repository --repository-name $$ECR_REPO --region $$AWS_REGION >/dev/null

ecr-push:
	@if [ -z "$$AWS_REGION" ] || [ -z "$$ECR_ACCOUNT_ID" ] || [ -z "$$ECR_REPO" ]; then echo "Set AWS_REGION, ECR_ACCOUNT_ID, ECR_REPO"; exit 1; fi
	docker tag $(IMAGE) $$ECR_ACCOUNT_ID.dkr.ecr.$$AWS_REGION.amazonaws.com/$$ECR_REPO:latest
	docker push $$ECR_ACCOUNT_ID.dkr.ecr.$$AWS_REGION.amazonaws.com/$$ECR_REPO:latest

# ---------- GCP Artifact Registry ----------
gcp-login:
	@gcloud --version >/dev/null 2>&1 || (echo "Install gcloud CLI"; exit 1)
	@if [ -z "$$GCP_LOCATION" ] || [ -z "$$GCP_PROJECT_ID" ] || [ -z "$$GCP_REPO" ]; then echo "Set GCP_LOCATION, GCP_PROJECT_ID, GCP_REPO"; exit 1; fi
	gcloud auth configure-docker $$GCP_LOCATION-docker.pkg.dev -q
	@gcloud artifacts repositories describe $$GCP_REPO --location=$$GCP_LOCATION >/dev/null 2>&1 || gcloud artifacts repositories create $$GCP_REPO --repository-format=DOCKER --location=$$GCP_LOCATION

gcp-push:
	@if [ -z "$$GCP_LOCATION" ] || [ -z "$$GCP_PROJECT_ID" ] || [ -z "$$GCP_REPO" ]; then echo "Set GCP_LOCATION, GCP_PROJECT_ID, GCP_REPO"; exit 1; fi
	docker tag $(IMAGE) $$GCP_LOCATION-docker.pkg.dev/$$GCP_PROJECT_ID/$$GCP_REPO/docker-secure-image-multicloud-bootcamp-1day:latest
	docker push $$GCP_LOCATION-docker.pkg.dev/$$GCP_PROJECT_ID/$$GCP_REPO/docker-secure-image-multicloud-bootcamp-1day:latest

# ---------- Azure ACR ----------
acr-login:
	@if [ -z "$$ACR_NAME" ]; then echo "Set ACR_NAME"; exit 1; fi
	az --version >/dev/null 2>&1 || (echo "Install Azure CLI"; exit 1)
	az acr login --name $$ACR_NAME

acr-push:
	@if [ -z "$$ACR_NAME" ]; then echo "Set ACR_NAME"; exit 1; fi
	docker tag $(IMAGE) $$ACR_NAME.azurecr.io/docker-secure-image-multicloud-bootcamp-1day:latest
	docker push $$ACR_NAME.azurecr.io/docker-secure-image-multicloud-bootcamp-1day:latest

# ---------- CIS benchmark ----------
cis:
	bash scripts/docker_bench.sh


# ===== Alpine Path & Extras =====
build-alpine:
	docker build -f Dockerfile.alpine -t secure-alpine-flask:latest .

run-alpine:
	docker run --rm -p 8080:8080 \	  --read-only \	  --tmpfs /tmp \	  --security-opt no-new-privileges \	  --cap-drop=ALL \	  --seccomp=security/seccomp.json \	  --security-opt apparmor=secure-flask \	  secure-alpine-flask:latest

scan-alpine:
	bash scripts/scan_trivy.sh secure-alpine-flask:latest

sbom-alpine:
	bash scripts/generate_sbom_syft.sh secure-alpine-flask:latest

sign-alpine:
	bash scripts/sign_cosign.sh secure-alpine-flask:latest

compare:
	@echo "Distroless vs Alpine Image Size:"
	docker images --format '{{.Repository}}\t{{.Tag}}\t{{.Size}}' | grep -E '(secure-alpine-flask|docker-secure-image-multicloud-bootcamp-1day)' || true

bench-report:
	bash scripts/docker_bench_report.sh

kyverno-apply:
	kubectl apply -f k8s/kyverno/

falco-lab:
	@echo "Follow docs/lessons/lab-falco.md to run Falco and trigger alerts."
