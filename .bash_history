git push -u origin main
exit
cd trinity-cloud-security-course
git add .
git commit -m "init: Day 1 foundation"
git push -u origin main
git init
git add .
git commit -m "init: Day 1 foundation"
git branch -M main
git remote add origin https://github.com/Olagoldstx/trinity-cloud-security-course.git
git push -u origin main
cd /mnt/c/windows/system32
sudo rm -rf .git
cd /mnt/c/windows/system32
sudo rm -rf .git
cd ~
pwd
ls
# find your Windows Downloads folder from WSL
WINUSER=$(cmd.exe /c echo %USERNAME% | tr -d '\r')
cd "/mnt/c/Users/$WINUSER/Downloads"
# confirm the zip is there
ls -lh *trinity-cloud-security-course*.zip
# unzip it into your Linux home
unzip -q trinity-cloud-security-course.zip -d ~/
# go to the project
cd ~/trinity-cloud-security-course
# from: ~/trinity-cloud-security-course
mkdir -p /tmp/trinity_unpack
unzip -q "trinity-cloud-security-course (1).zip" -d /tmp/trinity_unpack 2>/dev/null || unzip -q trinity-cloud-security-course.zip -d /tmp/trinity_unpack
# If the zip created a nested folder, move its contents up into the current dir:
NESTED=$(ls -1 /tmp/trinity_unpack | head -n1)
shopt -s dotglob
mv /tmp/trinity_unpack/$NESTED/* .
shopt -u dotglob
rm -rf /tmp/trinity_unpack
# from: ~/trinity-cloud-security-course
mkdir -p /tmp/trinity_unpack
unzip -q "trinity-cloud-security-course (1).zip" -d /tmp/trinity_unpack 2>/dev/null || unzip -q trinity-cloud-security-course.zip -d /tmp/trinity_unpack
# If the zip created a nested folder, move its contents up into the current dir:
NESTED=$(ls -1 /tmp/trinity_unpack | head -n1)
shopt -s dotglob
mv /tmp/trinity_unpack/$NESTED/* .
shopt -u dotglob
rm -rf /tmp/trinity_unpack
cd ~
rm -rf ~/trinity-cloud-security-course
mkdir ~/trinity-cloud-security-course
cd ~/trinity-cloud-security-course
cd ~
rm -rf ~/trinity-cloud-security-course
mkdir ~/trinity-cloud-security-course
cd ~/trinity-cloud-security-course
unzip -q ~/trinity-cloud-security-course.zip -d ~/trinity-cloud-security-course
ls -la
unzip -q ~/trinity-cloud-security-course\ \(1\).zip -d ~/trinity-cloud-security-course
cd ~
ls -lh *trinity-cloud-security-course*
# search your Linux home
find ~ -maxdepth 3 -type f -iname "*trinity-cloud-security-course*.zip"
# also check your Windows Downloads from WSL
WINUSER=$(cmd.exe /c echo %USERNAME% | tr -d '\r')
find "/mnt/c/Users/$WINUSER/Downloads" -maxdepth 2 -type f -iname "*trinity-cloud-security-course*.zip"
unzip -q "/mnt/c/Users/golds/Downloads/trinity-cloud-security-course.zip" -d ~/
cd ~/trinity-cloud-security-course
ls -la
git init
git add .
git commit -m "init: Trinity Cloud Security Course — Day 1 foundation"
git branch -M main
git remote add origin https://github.com/Olagoldstx/trinity-cloud-security-course.git
git push -u origin main
git config --global user.name "Olagoldstx"
git config --global user.email "107962449+Olagoldstx@users.noreply.github.com"
git config --global --list
cd ~/trinity-cloud-security-course
git add .
git commit -m "init: Trinity Cloud Security Course — Day 1 foundation"
git branch -M main
git remote add origin https://github.com/Olagoldstx/trinity-cloud-security-course.git
git push -u origin main
[200~git remote -v
~[200~git remote -v
git remote -v
git push -u origin main
cd ~/trinity-cloud-security-course
# create the Day 1 folder if it doesn't exist already
mkdir -p modules/aws/01-iam-and-federation/day1-least-privilege-surgery
# unzip the pack into Day 1
unzip -q ~/Downloads/day1-iam-expansion.zip   -d modules/aws/01-iam-and-federation/day1-least-privilege-surgery || unzip -q /mnt/c/Users/golds/Downloads/day1-iam-expansion.zip   -d modules/aws/01-iam-and-federation/day1-least-privilege-surgery || unzip -q /mnt/data/day1-iam-expansion.zip   -d modules/aws/01-iam-and-federation/day1-least-privilege-surgery
# commit and push
git add .
git commit -m "day1: IAM Least-Privilege Expansion Pack (Terraform + Simulator + Diagram + Flashcards)"
git push
export AWS_PROFILE=sandbox
terraform -chdir=modules/aws/01-iam-and-federation/day1-least-privilege-surgery/terraform init
terraform -chdir=modules/aws/01-iam-and-federation/day1-least-privilege-surgery/terraform apply -auto-approve
bash modules/aws/01-iam-and-federation/day1-least-privilege-surgery/scripts/simulate-policy.sh   "$(terraform -chdir=modules/aws/01-iam-and-federation/day1-least-privilege-surgery/terraform output -raw role_name)"   "$(terraform -chdir=modules/aws/01-iam-and-federation/day1-least-privilege-surgery/terraform output -raw bucket_name)"
export AWS_PROFILE=sandbox
terraform -chdir=modules/aws/01-iam-and-federation/day1-least-privilege-surgery/terraform init
terraform -chdir=modules/aws/01-iam-and-federation/day1-least-privilege-surgery/terraform apply -auto-approve
bash modules/aws/01-iam-and-federation/day1-least-privilege-surgery/scripts/simulate-policy.sh   "$(terraform -chdir=modules/aws/01-iam-and-federation/day1-least-privilege-surgery/terraform output -raw role_name)"   "$(terraform -chdir=modules/aws/01-iam-and-federation/day1-least-privilege-surgery/terraform output -raw bucket_name)"
pwd
ls -la modules/aws/01-iam-and-federation/day1-least-privilege-surgery
cd ~/trinity-cloud-security-course
# move everything up one level
mv modules/aws/01-iam-and-federation/day1-least-privilege-surgery/day1-iam-expansion/*    modules/aws/01-iam-and-federation/day1-least-privilege-surgery/
# remove the now-empty wrapper folder
rmdir modules/aws/01-iam-and-federation/day1-least-privilege-surgery/day1-iam-expansion
ls -la modules/aws/01-iam-and-federation/day1-least-privilege-surgery
chmod +x modules/aws/01-iam-and-federation/day1-least-privilege-surgery/scripts/simulate-policy.sh
terraform -chdir=modules/aws/01-iam-and-federation/day1-least-privilege-surgery/terraform init
terraform -chdir=modules/aws/01-iam-and-federation/day1-least-privilege-surgery/terraform apply -auto-approve
ROLE_NAME=$(terraform -chdir=modules/aws/01-iam-and-federation/day1-least-privilege-surgery/terraform output -raw role_name)
BUCKET_NAME=$(terraform -chdir=modules/aws/01-iam-and-federation/day1-least-privilege-surgery/terraform output -raw bucket_name)
bash modules/aws/01-iam-and-federation/day1-least-privilege-surgery/scripts/simulate-policy.sh "$ROLE_NAME" "$BUCKET_NAME"
# 1) Configure the SSO profile (one-time)
aws configure sso --profile sandbox
# Answer prompts (your SSO start URL, region, account, role, session duration)
# 2) Log in to SSO
aws sso login --profile sandbox
# 3) Sanity check
aws sts get-caller-identity --profile sandbox
cd
# 🏗️ Create root directory
mkdir -p ~/projects/multi-cloud-security-architect-course
cd ~/projects/multi-cloud-security-architect-course
# 📚 Docs and binders
mkdir -p docs/{theories,diagrams,checklists} binder
# 🧩 Modules
mkdir -p module-1-foundations/labs
mkdir -p module-2-cloud-basics
mkdir -p module-3-multi-cloud-architectures
mkdir -p module-4-automation-container-security
mkdir -p module-5-advanced-cloud-security
mkdir -p module-6-capstone
# 🗂️ Capstone and roadmap
touch module-6-capstone/{README.md,project-guidelines.md}
touch binder/{syllabus.md,roadmap.md}
tree -L 2
sudo apt install tree -y
tree -L 2
# 🏗️ Create root directory
mkdir -p ~/projects/multi-cloud-security-architect-course
cd ~/projects/multi-cloud-security-architect-course
# 📚 Docs and binders
mkdir -p docs/{theories,diagrams,checklists} binder
# 🧩 Modules
mkdir -p module-1-foundations/labs
mkdir -p module-2-cloud-basics
mkdir -p module-3-multi-cloud-architectures
mkdir -p module-4-automation-container-security
mkdir -p module-5-advanced-cloud-security
mkdir -p module-6-capstone
# 🗂️ Capstone and roadmap
touch module-6-capstone/{README.md,project-guidelines.md}
touch binder/{syllabus.md,roadmap.md}
tree -L 2
nano README.md
cat README.md | head -n 20
cd ~/projects/multi-cloud-security-architect-course
mkdir -p module-1-foundations/labs
nano module-1-foundations/day1-networking-theories.md
cd
ls
ls -la
cd ~/projects/multi-cloud-security-architect-coursecd ~/projects/multi-cloud-security-architect-course
cd ~/projects/multi-cloud-security-architect-course
cat module-1-foundations/day1-networking-theories.md | head -n 10
nano module-1-foundations/day1-layer1-physical.md
nano docs/diagrams/layer1-diagram.mmd
ls module-1-foundations | grep layer1
ls docs/diagrams | grep layer1
nano module-1-foundations/day1-layer4-transport.md
nano docs/diagrams/layer4-transport-diagram.mmd
ls module-1-foundations | grep layer4
ls docs/diagrams | grep layer4
ip a
ip route
Install and enable ufw
sudo apt update && sudo apt install ufw -y
cd ~/projects/multi-cloud-security-architect-course
nano module-1-foundations/day2-linux-windows-os.md
cat module-1-foundations/day2-linux-windows-os.md | head -n 10
cd ~/projects/multi-cloud-security-architect-course
nano module-1-foundations/day3-iam-fundamentals.md
cat module-1-foundations/day3-iam-fundamentals.md | head -n 10
cd ~/projects/multi-cloud-security-architect-course
pwd
ls -la
ls -la module-1-foundations
head -n 5 README.md
_This
_“To
ls -la module-1-foundations
cd ~/projects/multi-cloud-security-architect-course
nano module-1-foundations/day4-encryption-key-management.md
cat module-1-foundations/day4-encryption-key-management.md | head -n 10
cd ~/projects/multi-cloud-security-architect-course
nano module-1-foundations/day5-zero-trust-networking.md
cat module-1-foundations/day5-zero-trust-networking.md | head -n 10
cd ~/projects/multi-cloud-security-architect-course
nano module-2-cloud-basics/day1-cloud-security-fundamentals.md
cat module-2-cloud-basics/day1-cloud-security-fundamentals.md | head -n 10
cd ~/projects/multi-cloud-security-architect-course
nano module-2-cloud-basics/day1-cloud-security-fundamentals.md
cat module-2-cloud-basics/day1-cloud-security-fundamentals.md | head -n 10
nano module-2-cloud-basics/day1-cloud-security-fundamentals.md
cat module-2-cloud-basics/day1-cloud-security-fundamentals.md | head -n 10
cd ~/projects/multi-cloud-security-architect-course
nano module-4-automation-container-security/day3-devsecops-continuous-compliance.md
cat module-4-automation-container-security/day3-devsecops-continuous-compliance.md | head -n 10
cd ~/projects/multi-cloud-security-architect-course
git init
git branch -m main
git add .
git commit -m "v1: complete modules 1–3 and module4 days1–3 — full foundations built"
nano .gitignore
nano LICENSE
mkdir -p .github/workflows
nano .github/workflows/validate.yml
git add .
git commit -m "add .gitignore, MIT LICENSE, and CI validator workflow"
git remote add origin https://github.com/Olagoldstx/multi-cloud-security-architect-course.git
git push -u origin main
cd
unzip docker-security-masterclass-professor-edition.zip
cd docker-secure-image-multicloud-bootcamp-1day
make build
make run
# in another terminal:
curl -s http://127.0.0.1:8080/ | jq .
unzip docker-security-masterclass-professor-edition.zip
cd docker-secure-image-multicloud-bootcamp-1day
make build
make run
exit
cd
ip a | grep inet
sudo systemctl status ssh
sudo apt update
sudo apt install -y openssh-server
sudo systemctl enable --now ssh
sudo ss -tulpn | grep ':22'   # confirm it’s listening on port 22
sudo ufw allow OpenSSH || true  # if UFW is enabled
hostname -I                     # note the VM IP (you showed 172.23.164.132)
exit
cd
# 1) Find the file in your Windows Downloads from WSL:
ls "/mnt/c/Users/golds/Downloads"
# 2) Copy it into your Linux home:
cp "/mnt/c/Users/golds/Downloads/docker-security-masterclass-professor-edition.zip" ~/
# If it’s not there, check OneDrive Downloads:
# ls "/mnt/c/Users/golds/OneDrive/Downloads"
# cp "/mnt/c/Users/golds/OneDrive/Downloads/docker-security-masterclass-professor-edition.zip" ~/
# 3) Unzip & enter the project
cd ~
unzip docker-security-masterclass-professor-edition.zip
cd docker-secure-image-multicloud-bootcamp-1day
sudo apt-get update
sudo apt-get install -y make jq
make build
make run
# from repo root
make build-alpine
make run-alpine
# in another terminal:
curl -s http://127.0.0.1:8080/ | jq .
docker run --rm -p 8080:8080   --read-only   --tmpfs /tmp   --security-opt no-new-privileges   --cap-drop=ALL   --security-opt seccomp=security/seccomp.json   --security-opt apparmor=secure-flask   secure-alpine-flask:latest
docker run --rm -p 8080:8080   --read-only   --tmpfs /tmp   --security-opt no-new-privileges   --cap-drop=ALL   --security-opt seccomp=security/seccomp.json   --security-opt apparmor=secure-flask   secure-alpine-flask:latest
docker info
docker info | grep -E "Server|Context|Name"
docker context ls
make clean
make build-alpine
docker images | grep secure-alpine-flask
docker run --rm -p 8080:8080   --read-only   --tmpfs /tmp   --security-opt no-new-privileges   --cap-drop=ALL   --security-opt seccomp=$(pwd)/security/seccomp.json   secure-alpine-flask:latest
secure-alpine-flask   latest   ...   97.1MB
# simplest run (no hardening) — should start cleanly
docker run --rm -p 8080:8080 secure-alpine-flask:latest
# start the app by explicitly using the venv's gunicorn
docker run --rm --name secureapp -p 8080:8080   secure-alpine-flask:latest   /venv/bin/gunicorn -w 2 -b 0.0.0.0:8080 main:app
wsl
cd
exit
cd
curl -s http://127.0.0.1:8080/ | jq .
exit
curl -s http://127.0.0.1:8080/ | jq .
cd
/docker-secure-image-multicloud-bootcamp-1day
~/docker-secure-image-multicloud-bootcamp-1day
cd ~/docker-secure-image-multicloud-bootcamp-1day
curl -s http://127.0.0.1:8080/ | jq .
cd
:~/docker-secure-image-multicloud-bootcamp-1day
:~/docker-secure-image-multicloud-bootcamp-1da
~/docker-secure-image-multicloud-bootcamp-1day
~/docker-secure-image-multicloud-bootcamp-1day$
cd ~/docker-secure-image-multicloud-bootcamp-1day
docker exec secureapp sh -lc 'id -u && id -un'
# expect: a non-zero UID (e.g., 1000) and a username like "appuser"
docker exec secureapp sh -lc 'echo test >/etc/hosts || echo "read-only OK"'
docker exec secureapp sh -lc 'grep CapEff /proc/self/status'
docker inspect secureapp --format '{{json .HostConfig.SecurityOpt}}'
# simple rebuild of the Debian slim → distroless image
make clean
make build         # uses Dockerfile (distroless final)
docker images | grep -E 'multicloud-bootcamp|secure-alpine-flask'
docker images --format '{{.Repository}}:{{.Tag}}\t{{.Size}}' | grep -E 'secure-alpine-flask|multicloud-bootcamp'
# start the app by explicitly using the venv's gunicorn
docker run --rm --name secureapp -p 8080:8080   secure-alpine-flask:latest   /venv/bin/gunicorn -w 2 -b 0.0.0.0:8080 main:app
cd
# start the app by explicitly using the venv's gunicorn
docker run --rm --name secureapp -p 8080:8080   secure-alpine-flask:latest   /venv/bin/gunicorn -w 2 -b 0.0.0.0:8080 main:app
nano app/requirements.txt
cd ~/docker-secure-image-multicloud-bootcamp-1day
ls app
nano app/requirements.txt
make build-alpine
docker run --rm --name secureapp -p 8080:8080   secure-alpine-flask:latest   /venv/bin/python -m gunicorn -w 2 -b 0.0.0.0:8080 main:app
nano Dockerfile.alpine
docker run --rm --name secureapp -p 8080:8080 secure-alpine-flask:latest
make build-alpine
docker run --rm --name secureapp -p 8080:8080 secure-alpine-flask:latest
cd
cat > Dockerfile.alpine <<'EOF'
# ---- build stage (Alpine) ----
FROM python:3.12-alpine AS build

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Build deps only for compile time
RUN apk add --no-cache gcc musl-dev libffi-dev openssl-dev cargo

WORKDIR /app
COPY app/requirements.txt .

# Create venv in stable path and install deps (ensure gunicorn present)
RUN python -m venv /opt/venv \
 && /opt/venv/bin/pip install --no-cache-dir -r requirements.txt \
 && /opt/venv/bin/pip install --no-cache-dir gunicorn

# Copy application
COPY app/ .

# ---- runtime stage (Alpine) ----
FROM alpine:3.20

# Minimal runtime (python only)
RUN apk add --no-cache python3

# Non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Put venv on PATH so tools resolve, but use absolute path in CMD anyway
ENV PATH="/opt/venv/bin:$PATH" \
    APP_ENV=prod

WORKDIR /app

# Copy venv + app from builder
COPY --from=build /opt/venv /opt/venv
COPY --from=build /app /app

USER appuser
EXPOSE 8080

# Use absolute venv path to avoid PATH surprises
CMD ["/opt/venv/bin/gunicorn","-w","2","-b","0.0.0.0:8080","main:app"]
EOF

make build-alpine
docker run --rm --name secureapp -p 8080:8080 secure-alpine-flask:latest
cd ~/docker-secure-image-multicloud-bootcamp-1day
cat > Dockerfile.alpine <<'EOF'
# ---- build stage (Alpine) ----
FROM python:3.12-alpine AS build

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Build deps only for compile time
RUN apk add --no-cache gcc musl-dev libffi-dev openssl-dev cargo

WORKDIR /app
COPY app/requirements.txt .

# Create venv in stable path and install deps (ensure gunicorn present)
RUN python -m venv /opt/venv \
 && /opt/venv/bin/pip install --no-cache-dir -r requirements.txt \
 && /opt/venv/bin/pip install --no-cache-dir gunicorn

# Copy application
COPY app/ .

# ---- runtime stage (Alpine) ----
FROM alpine:3.20

# Minimal runtime (python only)
RUN apk add --no-cache python3

# Non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Put venv on PATH so tools resolve, but use absolute path in CMD anyway
ENV PATH="/opt/venv/bin:$PATH" \
    APP_ENV=prod

WORKDIR /app

# Copy venv + app from builder
COPY --from=build /opt/venv /opt/venv
COPY --from=build /app /app

USER appuser
EXPOSE 8080

# Use absolute venv path to avoid PATH surprises
CMD ["/opt/venv/bin/gunicorn","-w","2","-b","0.0.0.0:8080","main:app"]
EOF

make build-alpine
docker run --rm --name secureapp -p 8080:8080 secure-alpine-flask:latest
ls
nano app/requirements.txt
docker build -f Dockerfile.alpine -t secure-alpine-flask:latest .
docker run --rm --name secureapp -p 8080:8080 secure-alpine-flask:latest
nano Dockerfile.alpine
nano app/requirements.txt
docker build -f Dockerfile.alpine -t secure-alpine-flask:latest .
docker run --rm --name secureapp -p 8080:8080 secure-alpine-flask:latest
# stop any previous run first (Ctrl+C in that terminal)
docker run --rm --name secureapp -p 8080:8080   --read-only   --tmpfs /tmp   --security-opt no-new-privileges   --cap-drop=ALL   --pids-limit=200   --memory=256m --memory-swap=256m   secure-alpine-flask:latest
cd
nano secure-network-course/day1-foundations.md
mkdir -p ~/secure-network-course
ls ~
cd ~/secure-network-course
ls -l
day1-foundations.md
nano day1-foundations.md
ls
nano day1-foundations.md
nano day2-test-environment.md
ls
nano day3-live-environment.md
nano day4-promotion-pipeline.md
ls
nano day5-hardening-egress-control.md
ls
day1-foundations.md
nano day1-foundations.md
nano day6-threat-detection-compliance.md
ls
nano day7-incident-response-recovery.md
ls
nano day1-3-diagrams-and-anki.md
ls
nano day8-multicloud-hybrid-security.md
nano day9-zero-trust-workload-segmentation.md
nano day10-ai-ml-self-healing-security.md
cd ~/aws-multicloud-security-blueprint
nano README.md
cd ~/aws-multicloud-security-blueprint
nano README.md
cd ~
git clone https://github.com/Olagoldstx/aws-multicloud-security-blueprint.git
mv ~/secure-network-course/* ~/aws-multicloud-security-blueprint/
ls ~/aws-multicloud-security-blueprint
cd ~/aws-multicloud-security-blueprint
nano README.md
git add .
git commit -m "v1: AWS Multicloud Security Blueprint – Full 10-Day Course"
git branch -M main
git push -u origin main
cd
cd:~/docker-secure-image-multicloud-bootcamp-1day
~/docker-secure-image-multicloud-bootcamp-1day
cd ~/docker-secure-image-multicloud-bootcamp-1day
# one-liner to comment out the apt-get block in Dockerfile
sed -i '/apt-get update/,+2 s/^/# /' Dockerfile
make clean
make build    # try the Debian build again if you want to compare later
nano Dockerfile.alpine
docker build -f Dockerfile.alpine -t secure-alpine-flask:latest .
docker images | grep secure-alpine-flask
# simple
docker run --rm --name secureapp -p 8080:8080 secure-alpine-flask:latest
# (in another terminal)
curl -s http://127.0.0.1:8080/ | jq .
docker run --rm --name secureapp -p 8080:8080   --read-only   --tmpfs /tmp   --security-opt no-new-privileges   --cap-drop=ALL   --pids-limit=200   --memory=256m --memory-swap=256m   secure-alpine-flask:latest
cd
cd ~/docker-secure-image-multicloud-bootcamp-1day
# simple
docker run --rm --name secureapp -p 8080:8080 secure-alpine-flask:latest
# (in another terminal)
curl -s http://127.0.0.1:8080/ | jq .
# from the repo root
mkdir -p results
docker run --rm   -v /var/run/docker.sock:/var/run/docker.sock   -v "$PWD:/work"   anchore/syft:latest   secure-alpine-flask:latest -o spdx-json > sbom.spdx.json
ls -lh sbom.spdx.json   # should exist (~tens of KB)
# JSON report to results/trivy.json
docker run --rm   -v /var/run/docker.sock:/var/run/docker.sock   -v "$PWD/results:/results"   aquasec/trivy:latest image   --format json --output /results/trivy.json   --severity CRITICAL,HIGH   secure-alpine-flask:latest
jq '.Results[].Vulnerabilities | length' results/trivy.json | paste -sd+ - | bc
# (optional) shows total count across layers
bash scripts/scan_trivy.sh secure-alpine-flask:latest
mkdir -p results
docker run --rm   -v /var/run/docker.sock:/var/run/docker.sock   -v "$PWD/results:/results"   aquasec/trivy:latest image   --format json --output /results/trivy.json   --severity CRITICAL,HIGH   secure-alpine-flask:latest
# quick sanity check: total vulns counted across results
jq '.Results[].Vulnerabilities | length' results/trivy.json | paste -sd+ - | bc
ls -lh results/trivy.json
# make the script follow redirects and use the container if available
sed -i 's/curl -sS/curl -sSL/g' scripts/scan_trivy.sh
# or simply change the script body to call the containerized command above
# generate key pair (creates cosign.key & cosign.pub in your repo)
docker run --rm -it   -v "$PWD:/work" -w /work   ghcr.io/sigstore/cosign/cosign:latest   generate-key-pair
# sign local image
docker run --rm -it   -v "$PWD:/work" -w /work   -v /var/run/docker.sock:/var/run/docker.sock   ghcr.io/sigstore/cosign/cosign:latest   sign --key cosign.key docker.io/library/secure-alpine-flask:latest
# verify signature
docker run --rm -it   -v "$PWD:/work" -w /work   -v /var/run/docker.sock:/var/run/docker.sock   ghcr.io/sigstore/cosign/cosign:latest   verify --key cosign.pub docker.io/library/secure-alpine-flask:latest
rm -f cosign.key cosign.pub cosign.sig cosign.cert
docker run --rm -it   -e COSIGN_PASSWORD=""   -v "$PWD:/work" -w /work   ghcr.io/sigstore/cosign/cosign:latest   generate-key-pair
cd ~/docker-secure-image-multicloud-bootcamp-1day
sudo chown -R $(whoami):$(whoami) .
docker run --rm -it   -e COSIGN_PASSWORD=""   -v "$(pwd):/work" -w /work   --user "$(id -u):$(id -g)"   ghcr.io/sigstore/cosign/cosign:latest   generate-key-pair
ls -l cosign.*
docker run --rm -it   -e COSIGN_PASSWORD=""   -v "$(pwd):/work" -w /work   -v /var/run/docker.sock:/var/run/docker.sock   --user "$(id -u):$(id -g)"   ghcr.io/sigstore/cosign/cosign:latest   sign --key cosign.key   --output-signature cosign.sig   --output-certificate cosign.cert   --upload=false   secure-alpine-flask:latest
docker run --rm -it   -v "$(pwd):/work" -w /work   -v /var/run/docker.sock:/var/run/docker.sock   --user "$(id -u):$(id -g)"   ghcr.io/sigstore/cosign/cosign:latest   verify --key cosign.pub   --certificate cosign.cert   --signature cosign.sig   secure-alpine-flask:latest
mkdir -p .sigstore
docker run --rm -it   -e COSIGN_PASSWORD="" \                   # no passphrase prompt
mkdir -p .sigstore
docker run --rm -it   -e COSIGN_PASSWORD=   -e SIGSTORE_HOME=/work/.sigstore   -e HOME=/work   -v "$(pwd):/work" -w /work   --user "$(id -u):$(id -g)"   ghcr.io/sigstore/cosign/cosign:latest   generate-key-pair
docker run --rm -it   -e COSIGN_PASSWORD=   -e SIGSTORE_HOME=/work/.sigstore   -e HOME=/work   -v "$(pwd):/work" -w /work   -v /var/run/docker.sock:/var/run/docker.sock   --user "$(id -u):$(id -g)"   ghcr.io/sigstore/cosign/cosign:latest   sign --key cosign.key   --output-signature cosign.sig   --output-certificate cosign.cert   --upload=false   secure-alpine-flask:latest
docker run --rm -it   -e SIGSTORE_HOME=/work/.sigstore   -e HOME=/work   -v "$(pwd):/work" -w /work   -v /var/run/docker.sock:/var/run/docker.sock   --user "$(id -u):$(id -g)"   ghcr.io/sigstore/cosign/cosign:latest   verify --key cosign.pub   --certificate cosign.cert   --signature cosign.sig   secure-alpine-flask:latest
# Search Docker Hub for the image
docker search secure-alpine-flask
# Or check manually at hub.docker.com
# Use official Python Alpine image
docker pull python:3.9-alpine
# Or build from it in your Dockerfile
FROM python:3.9-alpine
# Install Flask and other dependencies
RUN pip install flask
# Add your security hardening here
RUN apk add --no-cache &&     adduser -D myappuser
USER myappuser
WORKDIR /app
COPY . .
CMD ["python", "app.py"]
# Create a file called Dockerfile
nano Dockerfile
# 0) Prepare a writable cache once
mkdir -p .sigstore
# 1) (Re)generate a password-less keypair if needed
docker run --rm -it   -e COSIGN_PASSWORD=   -e SIGSTORE_HOME=/work/.sigstore   -e HOME=/work   -v "$(pwd):/work" -w /work   --user "$(id -u):$(id -g)"   ghcr.io/sigstore/cosign/cosign:latest   generate-key-pair
docker run --rm -it   -e COSIGN_PASSWORD=   -e SIGSTORE_HOME=/work/.sigstore   -e HOME=/work   -v "$(pwd):/work" -w /work   -v /var/run/docker.sock:/var/run/docker.sock   --user "$(id -u):$(id -g)"   ghcr.io/sigstore/cosign/cosign:latest   sign --key cosign.key   --output-signature cosign.sig   --output-certificate cosign.cert   --upload=false   --local-image=always   secure-alpine-flask:latest
docker run --rm -it   -e SIGSTORE_HOME=/work/.sigstore   -e HOME=/work   -v "$(pwd):/work" -w /work   -v /var/run/docker.sock:/var/run/docker.sock   --user "$(id -u):$(id -g)"   ghcr.io/sigstore/cosign/cosign:latest   verify --key cosign.pub   --certificate cosign.cert   --signature cosign.sig   --local-image=always   secure-alpine-flask:latest
docker inspect --format='{{index .RepoDigests 0}}' secure-alpine-flask:latest
docker run --rm -it   -e COSIGN_PASSWORD=   -e SIGSTORE_HOME=/work/.sigstore   -e HOME=/work   -v "$(pwd):/work" -w /work   -v /var/run/docker.sock:/var/run/docker.sock   --user "$(id -u):$(id -g)"   ghcr.io/sigstore/cosign/cosign:latest   sign --key cosign.key   --output-signature cosign.sig   --output-certificate cosign.cert   --upload=false  secure-alpine-flask@sha256:ee1df8b04a53e303238785d200c07d76af70ba401c94735c05867f6e4799b80f.)
docker run --rm -it   -e COSIGN_PASSWORD=   -e SIGSTORE_HOME=/work/.sigstore   -e HOME=/work   -v "$(pwd):/work" -w /work   -v /var/run/docker.sock:/var/run/docker.sock   --user "$(id -u):$(id -g)"   ghcr.io/sigstore/cosign/cosign:latest   sign --key cosign.key   --output-signature cosign.sig   --output-certificate cosign.cert   --upload=false   secure-alpine-flask@sha256:ee1df8b04a53e303238785d200c07d76af70ba401c94735c05867f6e4799b80f
docker run --rm -it   -e COSIGN_PASSWORD=   -e SIGSTORE_HOME=/work/.sigstore   -e HOME=/work   -v "$(pwd):/work" -w /work   -v /var/run/docker.sock:/var/run/docker.sock   --user "$(id -u):$(id -g)"   ghcr.io/sigstore/cosign/cosign:latest   sign --key cosign.key   --output-signature cosign.sig   --output-certificate cosign.cert   --upload=false   secure-alpine-flask@sha256:ee1df8b04a53e303238785d200c07d76af70ba401c94735c05867f6e4799b80f
docker run -d --restart=always --name registry -p 5000:5000 registry:2
docker tag secure-alpine-flask:latest localhost:5000/secure-alpine-flask:latest
docker push localhost:5000/secure-alpine-flask:latest
mkdir -p .sigstore
docker run --rm -it   -e COSIGN_PASSWORD=   -e SIGSTORE_HOME=/work/.sigstore   -e HOME=/work   -v "$(pwd):/work" -w /work   --user "$(id -u):$(id -g)"   ghcr.io/sigstore/cosign/cosign:latest   generate-key-pair
docker run --rm -it   -e COSIGN_PASSWORD=   -e SIGSTORE_HOME=/work/.sigstore   -e HOME=/work   -v "$(pwd):/work" -w /work   --user "$(id -u):$(id -g)"   ghcr.io/sigstore/cosign/cosign:latest   sign --key cosign.key   --allow-insecure-registry   localhost:5000/secure-alpine-flask:latest
cd
cd ~/docker-secure-image-multicloud-bootcamp-1day
docker login
# enter your Docker Hub username + password
docker tag secure-alpine-flask:latest cloudlabxx/secure-alpine-flask:latest
docker login
# username: cloudlabxx
# then enter your Docker Hub password when prompted
docker push cloudlabxx/secure-alpine-flask:latest
docker run --rm -it   -e COSIGN_PASSWORD=   -e SIGSTORE_HOME=/work/.sigstore   -e HOME=/work   -v "$(pwd):/work" -w /work   --user "$(id -u):$(id -g)"   ghcr.io/sigstore/cosign/cosign:latest   sign --key cosign.key   docker.io/cloudlabxx/secure-alpine-flask:latest
docker run --rm -it   -e SIGSTORE_HOME=/work/.sigstore   -e HOME=/work   -v "$(pwd):/work" -w /work   --user "$(id -u):$(id -g)"   ghcr.io/sigstore/cosign/cosign:latest   verify --key cosign.pub   docker.io/cloudlabxx/secure-alpine-flask:latest
docker login
# username: cloudlabxx
# enter your Docker Hub password / token
docker run --rm -it   -e COSIGN_PASSWORD=   -e SIGSTORE_HOME=/work/.sigstore   -e HOME=/work   -e DOCKER_CONFIG=/work/.docker   -v "$HOME/.docker:/work/.docker:ro"   -v "$(pwd):/work" -w /work   --user "$(id -u):$(id -g)"   ghcr.io/sigstore/cosign/cosign:latest   sign --key cosign.key   docker.io/cloudlabxx/secure-alpine-flask:latest
docker tag secure-alpine-flask:latest cloudlabxx/secure-alpine-flask:latest
docker push cloudlabxx/secure-alpine-flask:latest
docker run --rm -it   -e COSIGN_PASSWORD=   -e SIGSTORE_HOME=/work/.sigstore   -e HOME=/work   -e DOCKER_CONFIG=/work/.docker   -v "$HOME/.docker:/work/.docker:ro"   -v "$(pwd):/work" -w /work   --user "$(id -u):$(id -g)"   ghcr.io/sigstore/cosign/cosign:latest   sign --key cosign.key   docker.io/cloudlabxx/secure-alpine-flask:latest
docker pull docker.io/cloudlabxx/secure-alpine-flask:latest
REF=$(docker inspect --format='{{index .RepoDigests 0}}' docker.io/cloudlabxx/secure-alpine-flask:latest)
echo "$REF"
# expected: docker.io/cloudlabxx/secure-alpine-flask@sha256:....
docker run --rm -it   -e HOME=/work   -v "$(pwd):/work" -w /work   ghcr.io/sigstore/cosign/cosign:latest   login docker.io
# enter: username = cloudlabxx, then your Docker Hub password / token
cd
# create root folder
mkdir -p ~/multi-cloud-iam-bootcamp/aws/labs && cd ~/multi-cloud-iam-bootcamp
git init
git remote add origin https://github.com/olagoldstx/multi-cloud-iam-bootcamp.git
git branch -M main
git push -u origin main
git remote add origin https://github.com/olagoldstx/multi-cloud-iam-bootcamp.git
git branch -M main
git push -u origin main
cd ~/multi-cloud-iam-bootcamp
# Step 1: verify the remote
git remote -v
# Step 2: add your first file (README)
echo "# Multi-Cloud IAM Bootcamp 🚀" > README.md
# Step 3: initialize and commit
git add .
git commit -m "Initial commit: project scaffold"
# Step 4: rename the default branch and push
git branch -M main
git push -u origin main
nano aws/day1-iam-foundations.md
git add diagrams/folder-structure.png
git commit -m "Add folder tree screenshot for portfolio"
git push
git add diagrams/folder-structure.png
git commit -m "Add folder tree screenshot for portfolio"
git push
git add aws/day1-iam-foundations.md
git commit -m "Day1: IAM Foundations across clouds"
git push
cd
cd ~/docker-secure-image-multicloud-bootcamp-1day
docker run --rm -it   -e HOME=/work   -v "$(pwd):/work" -w /work   ghcr.io/sigstore/cosign/cosign:latest   login -u cloudlabxx -p "YOUR_DOCKER_ACCESS_TOKEN" docker.io
mkdir -p .coshome
docker run --rm -it   -e HOME=/home/cos   -v "$(pwd)/.coshome:/home/cos"   -v "$(pwd):/work" -w /work   --user "$(id -u):$(id -g)"   ghcr.io/sigstore/cosign/cosign:latest   login -u cloudlabxx -p "YOUR_DOCKER_ACCESS_TOKEN" docker.io
docker pull cloudlabxx/secure-alpine-flask:latest
REF=$(docker inspect --format='{{index .RepoDigests 0}}' cloudlabxx/secure-alpine-flask:latest)
echo "$REF"
# looks like: docker.io/cloudlabxx/secure-alpine-flask@sha256:...
docker run --rm -it   -e COSIGN_PASSWORD=   -e HOME=/work   -v "$(pwd):/work" -w /work   --user "$(id -u):$(id -g)"   ghcr.io/sigstore/cosign/cosign:latest   sign --key cosign.key "$REF"
docker run --rm -it   -e HOME=/work   -v "$(pwd):/work" -w /work   --user "$(id -u):$(id -g)"   ghcr.io/sigstore/cosign/cosign:latest   verify --key cosign.pub "$REF"
docker run --rm -it   -e COSIGN_PASSWORD=   -e HOME=/home/cos   -e DOCKER_CONFIG=/home/cos/.docker   -v "$(pwd)/.coshome:/home/cos"   -v "$(pwd):/work" -w /work   --user "$(id -u):$(id -g)"   ghcr.io/sigstore/cosign/cosign:latest   sign --key cosign.key "$REF"
docker run --rm -it   -e HOME=/home/cos   -e DOCKER_CONFIG=/home/cos/.docker   -v "$(pwd)/.coshome:/home/cos"   -v "$(pwd):/work" -w /work   --user "$(id -u):$(id -g)"   ghcr.io/sigstore/cosign/cosign:latest   verify --key cosign.pub "$REF"
cd
mkdir docker-multi-cloud-security-masterclass
cd docker-multi-cloud-security-masterclass
nano README.md
mkdir -p day1/{modules,exercises} day2/{modules,exercises} scripts config diagrams anki-flashcards templates
tree /f
nano docker/Dockerfile
# Create project directory
mkdir docker-security-course
cd docker-security-course
# Create directory structure
mkdir day1 day2 scripts config diagrams anki-flashcards
# Verify creation
dir
# Create README.md with nano
nano README.md
nano day1/README.md
# Create Docker directory and file
mkdir docker
nano docker/Dockerfile
# Build your first secure image
docker build -t my-secure-app .
# Run it to test
docker run my-secure-app
cd
cd ~/docker-multi-cloud-security-masterclass/docker-security-course
ls -la
# Let's see if Dockerfile exists in docker/ folder
ls -la docker/
# Build from the docker subdirectory
docker build -t my-secure-app ./docker/
# Check the Dockerfile content
cat docker/Dockerfile
# Run your successfully built image
docker run my-secure-app
# Create your success log
nano success-log-day1.md
# 🎉 DAY 1 - FIRST SUCCESS!
## ✅ Milestone: First Secure Container Built & Run
### 📅 Date: $(date)
### 🐳 Image Details:
- **Name**: my-secure-app
- **Status**: ✅ Built and running successfully
- **Base Image**: Alpine Linux 3.18
- **Security Level**: Basic hardening applied
### 🔒 Security Features Implemented:
- [x] Minimal base image (Alpine)
- [x] Non-root user (appuser, UID 1000) 
- [x] Security updates during build
- [x] Proper working directory set
- [x] User context correctly configured
### 🖥️ Nano Skills Mastered:
- [x] File creation and editing
- [x] Proper save/exit workflow (Ctrl+O, Ctrl+X)
- [x] Content verification with `cat`
- [x] Troubleshooting file paths
### 🐳 Docker Commands Learned:
```bash
# Build from subdirectory
docker build -t my-secure-app ./docker/

# Run container
docker run my-secure-app

# Check built images
docker images
📚 Lessons Learned:
Path matters in Docker builds

Verification is crucial - always check file locations

Nano is reliable for Dockerfile editing

Security starts with basic principles

🎯 Next Steps in Security Masterclass:
Add vulnerability scanning

Implement health checks

Create multi-stage builds

Add security labels and metadata

Congratulations! You've completed your first secure Docker build!

```bash
# Create and open the success log in nano
nano success-log-day1.md
cd
cd ~/docker-multi-cloud-security-masterclass/docker-security-course
# Create and open the success log in nano
nano success-log-day1.md
cat success-log-day1.md
# Step 1: Open nano
nano day1-progress.md
cat day1-progress.md
# Create an advanced Dockerfile with multi-stage builds
nano docker/Dockerfile.advanced
# Create source directory
mkdir -p src
# Create a simple Go application
nano src/main.go
# Build the advanced secure image
docker build -t my-advanced-app -f docker/Dockerfile.advanced .
# Create proper Go module file
nano src/go.mod
# Create a simpler Go application that doesn't need HTTP
nano src/main.go
# Open the advanced Dockerfile for fixes
nano docker/Dockerfile.advanced
# 🐍 PYTHON MULTI-STAGE BUILD - SECURE
# Stage 1: Builder stage with build tools
FROM python:3.9-alpine as builder
# Install build dependencies
RUN apk add --no-cache build-base
# Copy requirements and install
COPY src/requirements.txt /tmp/
RUN pip install --user --no-cache-dir -r /tmp/requirements.txt
# Stage 2: Production stage - minimal
FROM python:3.9-alpine
# Security labels
LABEL maintainer="security-team@company.com"
LABEL stage="production"
LABEL security.scan="true"
# Create non-root user
RUN addgroup -g 1000 -S appgroup &&     adduser -u 1000 -S appuser -G appgroup
# Copy installed packages from builder
COPY --from=builder /root/.local /home/appuser/.local
# Copy application code
COPY src/app.py /app/
WORKDIR /app
# Set proper permissions
RUN chown -R appuser:appgroup /app
# Switch to non-root user
USER appuser
# Add user's local bin to PATH
ENV PATH="/home/appuser/.local/bin:${PATH}"
# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3     CMD python /app/app.py health
# Run application
CMD ["python", "/app/app.py"]
# Create the Python multi-stage Dockerfile IN NANO
nano docker/Dockerfile.python-multistage
# Create a simple multi-stage Dockerfile
nano docker/Dockerfile.simple
# Build the simple multi-stage image
docker build -t simple-multi-stage -f docker/Dockerfile.simple .
# Run it
docker run simple-multi-stage
# Open the simple Dockerfile in nano
nano docker/Dockerfile.simple
# Build the fixed version
docker build -t simple-multi-stage -f docker/Dockerfile.simple .
# Run it
docker run simple-multi-stage
# Create a proper multi-stage security example
nano docker/Dockerfile.multistage-secure
# Create a simple Node.js app
nano src/app.js
# Create package.json
nano src/package.json
# Build the Node.js multi-stage app
docker build -t secure-node-app -f docker/Dockerfile.multistage-secure .
# Run it
docker run secure-node-app
# Open the multi-stage Dockerfile in nano
nano docker/Dockerfile.multistage-secure
# Build the corrected multi-stage app
docker build -t secure-node-app -f docker/Dockerfile.multistage-secure .
# Run it
docker run secure-node-app
# Open the multi-stage Dockerfile in nano
nano docker/Dockerfile.multistage-secure
# Build the corrected multi-stage app
docker build -t secure-node-app -f docker/Dockerfile.multistage-secure .
# Run it in background
docker run -d -p 3000:3000 --name node-app secure-node-app
# Test it
curl http://localhost:3000/
# Check logs
docker logs node-app
# Stop it
docker stop node-app
docker rm node-app
# Check if container is running
docker ps -a
# Check the logs to see what the app is doing
docker logs node-app
docker ps -a
docker logs node-app
# Remove all stopped containers
docker container prune -f
# Check current containers (should be clean)
docker ps -a
# Create secrets management module
nano day2/modules/module5-secrets-management.md
# Create secrets management module
nano day2/modules/module5-secrets-management.md
# Create the correct file path
nano day2/modules/module5-secrets-management.md
# See what we actually have
pwd
ls -la
# Check what's in day2
ls -la day2/
# Check if modules directory exists in day2
ls -la day2/modules/
# Create the missing modules directory inside day2
mkdir -p day2/modules
# Verify it was created
ls -la day2/
# Create Module 5 in the correct location
nano day2/modules/module5-secrets-management.md
# Let me fix the module explanation
nano day2/modules/module5-secrets-management.md
# Check our actual docker-compose.secrets.yml
cat docker-compose.secrets.yml
# Create the docker-compose.secrets.yml file
nano docker-compose.secrets.yml
# Check what files we have
ls -la docker-compose* 2>/dev/null || echo "No compose files yet"
ls -la secrets/ 2>/dev/null || echo "No secrets directory yet"
ls -la src/ 2>/dev/null || echo "No src directory yet"
mkdir -p secrets
chmod 700 secrets
mkdir -p secrets
chmod 700 secrets
nano secrets/db_password.txt
# Create API key secret
nano secrets/api_key.txt
# Set secure permissions
chmod 600 secrets/*.txt
# Verify
ls -la secrets/
# Check what's in the existing app.js
cat src/app.js
# Create the secrets demo application that actually uses secrets
nano src/simple-secrets-app.js
# Create the Dockerfile for secrets demo
nano docker/Dockerfile.secrets-demo
# Build the secrets demo application
docker-compose -f docker-compose.secrets.yml build
# Open the Dockerfile to fix the user/group IDs
nano docker/Dockerfile.secrets-demo
# Update the docker-compose to use the simpler Dockerfile
nano docker-compose.secrets.yml
# Build with the fixed Dockerfile
docker-compose -f docker-compose.secrets.yml build
# If build succeeds, run the container
docker-compose -f docker-compose.secrets.yml up -d
# Check status
docker-compose -f docker-compose.secrets.yml ps
# Check what Dockerfiles actually exist
ls -la docker/
# Create the Dockerfile.secrets-simple that we referenced
nano docker/Dockerfile.secrets-simple
# Update docker-compose to remove the version line
nano docker-compose.secrets.yml
# Check all required files
echo "=== Verifying all files exist ==="
ls -la docker-compose.secrets.yml
ls -la docker/Dockerfile.secrets-simple
ls -la src/simple-secrets-app.js
ls -la src/package.json
ls -la secrets/db_password.txt
ls -la secrets/api_key.txt
# Build the application
docker-compose -f docker-compose.secrets.yml build
# Run the container
docker-compose -f docker-compose.secrets.yml up -d
# Check status
docker-compose -f docker-compose.secrets.yml ps
# Wait a moment for the app to start
sleep 3
# Test all endpoints
echo "=== TESTING SECRETS DEMO APPLICATION ==="
# Test main page
echo "1. Testing main page:"
curl http://localhost:3001/
# Test secrets info endpoint
echo ""
echo "2. Testing secrets info (should show masked secrets):"
curl http://localhost:3001/secrets-info
# Test health endpoint
echo ""
echo "3. Testing health check:"
curl http://localhost:3001/health
# Check application logs
echo ""
echo "4. Application logs:"
docker logs secrets-security-demo
# Create a fixed Dockerfile that handles permissions properly
nano docker/Dockerfile.secrets-fixed
# Update compose file to use the fixed Dockerfile
nano docker-compose.secrets.yml
# Build with the fixed Dockerfile
docker-compose -f docker-compose.secrets.yml build
# Run the container
docker-compose -f docker-compose.secrets.yml up -d
# Check status
docker-compose -f docker-compose.secrets.yml ps
# Check the container status more carefully
docker ps -a --filter "name=secrets-security-demo"
# Check the logs to see what's happening
docker logs secrets-security-demo
# Check if the container is actually running
docker inspect secrets-security-demo --format '{{.State.Status}}'
# Create a working docker-compose with volume mounts
nano docker-compose.working.yml
# Create the simple test app we discussed
nano src/test-secrets.js
# Update package.json to use the test app
nano src/package.json
# Update Dockerfile to use test app
nano docker/Dockerfile.minimal-working
# Clean up any old containers
docker-compose -f docker-compose.secrets.yml down 2>/dev/null || true
# Build and run the working version
docker-compose -f docker-compose.working.yml build
docker-compose -f docker-compose.working.yml up -d
# Check status
docker-compose -f docker-compose.working.yml ps
# Check logs
docker logs working-secrets-demo
# Test the application
curl http://localhost:3001/
# Create the proper secrets demo application
nano src/final-secrets-app.js
# Update Dockerfile to use the final app
nano docker/Dockerfile.final-secrets
# Create final working compose file
nano docker-compose.final.yml
# Stop previous containers
docker-compose -f docker-compose.working.yml down
# Build and run final version
docker-compose -f docker-compose.final.yml build
docker-compose -f docker-compose.final.yml up -d
# Check status
docker-compose -f docker-compose.final.yml ps
# Test all endpoints
echo "=== TESTING FINAL SECRETS DEMO ==="
echo "1. Main page:"
curl http://localhost:3001/
echo ""
echo "2. Secrets info (masked):"
curl http://localhost:3001/secrets-info
echo ""
echo "3. Security features:"
curl http://localhost:3001/security
echo ""
echo "4. Health check:"
curl http://localhost:3001/health
echo ""
echo "5. Application logs:"
docker logs final-secrets-demo
docker-compose -f docker-compose.final.yml down
# Create a Dockerfile that fixes permissions
nano docker/Dockerfile.fixed-permissions
# Update compose file
nano docker-compose.final.yml
# Create Dockerfile that uses existing node user
nano docker/Dockerfile.node-user
# Update compose to use node user
nano docker-compose.final.yml
# Build with fixed permissions
docker-compose -f docker-compose.final.yml build
docker-compose -f docker-compose.final.yml up -d
# Check logs
docker logs final-secrets-demo
# If still permission issues, check what's happening
docker exec final-secrets-demo whoami
docker exec final-secrets-demo ls -la /run/secrets/
# Run a debug container to see what's actually mounted
docker run -it --rm   -v $(pwd)/secrets:/run/secrets:ro   alpine:3.18   ls -la /run/secrets/
# Change the secrets directory permissions on host to be readable
chmod 755 secrets/
# Verify
ls -la secrets/
# Build and run the working version
docker-compose -f docker-compose.work.yml build
docker-compose -f docker-compose.work.yml up -d
# Check status
docker-compose -f docker-compose.work.yml ps
# Check logs to see if secrets load
docker logs working-secrets-demo
# Test the application
echo "=== TESTING APPLICATION ==="
curl http://localhost:3001/
echo ""
curl http://localhost:3001/secrets-info
echo ""
curl http://localhost:3001/health
# Create the docker-compose.work.yml file
nano docker-compose.work.yml
# Create the Dockerfile.working
nano docker/Dockerfile.working
# Create the working-secrets-app.js
nano src/working-secrets-app.js
# Check if package.json exists
cat src/package.json
# If it doesn't exist or is wrong, create it
nano src/package.json
# Check if package.json exists
cat src/package.json
# If it doesn't exist or is wrong, create it
nano src/package.json
# Make sure secret files are readable
chmod 644 secrets/*.txt 2>/dev/null || echo "Files already have permissions"
# Verify
ls -la secrets/
# Build the application
docker-compose -f docker-compose.work.yml build
# Run the container
docker-compose -f docker-compose.work.yml up -d
# Check status
docker-compose -f docker-compose.work.yml ps
# Check logs
docker logs working-secrets-demo
# Test the application
echo "=== TESTING ==="
curl http://localhost:3001/ && echo ""
curl http://localhost:3001/secrets-info && echo ""
curl http://localhost:3001/health && echo ""
# Create comprehensive success documentation
nano module5-complete-success.md
**Save with:** `Ctrl+O` → **Enter** → `Ctrl+X`
## 🏆 **UPDATE DAY 2 PROGRESS**
```bash
# Update Day 2 progress
nano day2/day2-progress.md

exit




wsl


nano day2/day2-progress.md




nano day2/day2-progress.md
# Run this from PowerShell (not inside Ubuntu)
Move-Item "$env:USERPROFILE\Downloads\dockerfile-security-playbook-aws.zip" "\\wsl$\Ubuntu\home\$env:USERNAME\"




# In PowerShell (Windows side)
mv ~/Downloads/dockerfile-security-playbook-aws.zip \\wsl$\\Ubuntu\\home\\$env:USERNAME\\
cd
# Run this from PowerShell (not inside Ubuntu)
Move-Item "$env:USERPROFILE\Downloads\dockerfile-security-playbook-aws.zip" "\\wsl$\Ubuntu\home\$env:USERNAME\"



cd
home
pwd
ls
exit
cd
# In Ubuntu (WSL)
cp /mnt/c/Users/<YourWindowsUsername>/Downloads/dockerfile-security-playbook-aws.zip ~/
cp /mnt/c/Users/$(cmd.exe /c "echo %USERNAME%" | tr -d '\r')/Downloads/dockerfile-security-playbook-aws.zip ~/
cp /mnt/c/Users/cloudlab/Downloads/dockerfile-security-playbook-aws.zip ~/
exit
cd
# host → web container
curl -s http://localhost:8080/healthz; echo
# inside web → api service (service discovery via compose)
docker compose exec web wget -qO- http://api:8080/healthz; echo
# host → web container
curl -s http://localhost:8080/healthz; echo
# inside web → api service (service discovery via compose)
docker compose exec web wget -qO- http://api:8080/healthz; echo
cd :~/dockerfile-security-playbook
cd ~/dockerfile-security-playbook
# host → web container
curl -s http://localhost:8080/healthz; echo
# inside web → api service (service discovery via compose)
docker compose exec web wget -qO- http://api:8080/healthz; echo
# host → web
curl -s http://localhost:8080/healthz; echo
# web container → api service (note the -f to point to the right compose file)
docker compose -f platform/compose/dev-stack.yaml exec web wget -qO- http://api:8080/healthz; echo
curl -s http://localhost:8080/api/healthz; echo
cat > apps/web-static-nginx/nginx.conf <<'EOF'
pid /tmp/nginx/nginx.pid;

events {}

http {
  access_log /dev/stdout;
  error_log  /dev/stderr info;

  # Writable temp paths for non-root
  client_body_temp_path /tmp/nginx/client_temp;
  proxy_temp_path       /tmp/nginx/proxy_temp;
  fastcgi_temp_path     /tmp/nginx/fastcgi_temp;
  uwsgi_temp_path       /tmp/nginx/uwsgi_temp;
  scgi_temp_path        /tmp/nginx/scgi_temp;

  upstream api_upstream {
    server api:8080;  # docker compose service name
    keepalive 16;
  }

  server {
    listen 8080;

    # static site
    location / {
      root /usr/share/nginx/html;
      try_files $uri $uri/ =404;
    }

    # health
    location /healthz { return 200 "ok"; }

    # proxy /api/* to Flask, dropping the /api prefix
    location /api/ {
      proxy_http_version 1.1;
      proxy_set_header Connection "";
      proxy_set_header Host $host;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;

      # rewrite /api/healthz -> /healthz
      rewrite ^/api/?(.*)$ /$1 break;

      proxy_pass http://api_upstream;
    }
  }
}
EOF

docker compose -f platform/compose/dev-stack.yaml up --build
cd
# host → web
curl -s http://localhost:8080/healthz; echo   # expect: ok
# web → api via proxy
curl -s http://localhost:8080/api/healthz; echo  # expect: {"status":"ok"}
cd ~/dockerfile-security-playbook
# in Makefile
# replace sbom target with:
sbom:
	mkdir -p sbom && syft scan image:$(IMAGE) -o json > sbom/$(APP).json
# Make sure no native engine is installed
sudo apt remove -y docker.io docker-ce docker-ce-cli containerd containerd.io runc moby* docker-compose-plugin || true
sudo apt -y autoremove
# Confirm docker works via Desktop daemon
docker version
docker run hello-world
# prerequisites
sudo apt update
sudo apt install -y ca-certificates curl gnupg
# keyring & repo
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg  | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu $(. /etc/os-release; echo $VERSION_CODENAME) stable"  | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# Is systemd running? (should print "systemd")
ps -p 1 -o comm=
sudo systemctl enable --now docker
# should print: active
systemctl is-active docker
# should print docker server info (no errors)
docker info
# smoke test pulls & runs a tiny container
docker run --rm hello-world
sudo apt update && sudo apt install -y ca-certificates curl wget unzip
# Trivy
curl -sSfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sudo sh -s -- -b /usr/local/bin
# Cosign
COSIGN_VERSION=$(curl -s https://api.github.com/repos/sigstore/cosign/releases/latest | grep tag_name | cut -d '"' -f 4)
sudo wget -O /usr/local/bin/cosign "https://github.com/sigstore/cosign/releases/download/${COSIGN_VERSION}/cosign-linux-amd64"
sudo chmod +x /usr/local/bin/cosign
# Conftest
CONFTEST_VERSION=$(curl -s https://api.github.com/repos/open-policy-agent/conftest/releases/latest | grep tag_name | cut -d '"' -f 4)
sudo wget -O /usr/local/bin/conftest "https://github.com/open-policy-agent/conftest/releases/download/${CONFTEST_VERSION}/conftest_Linux_x86_64"
sudo chmod +x /usr/local/bin/conftest
# Syft
curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sudo sh -s -- -b /usr/local/bin
trivy --version && cosign version && conftest --version && syft version
docker info           # should not error
docker run --rm hello-world
docker compose version
make build APP=api-python-flask
make scan  APP=api-python-flask      # fails on CRITICAL vulns
make sbom  APP=api-python-flask      # writes sbom/api-python-flask.json
make policy.check                    # OPA/Conftest on Dockerfile
# from repo root
docker build -t local/api-python-flask:dev apps/api-python-flask
docker images | grep api-python-flask
cat > apps/api-python-flask/Dockerfile <<'EOF'
# Multi-stage: builder
FROM --platform=$BUILDPLATFORM python:3.12-alpine AS builder
WORKDIR /opt/app
RUN adduser -S -D -H -u 1000 appuser
COPY requirements.txt .
RUN apk add --no-cache gcc musl-dev libffi-dev && \
    pip install --no-cache-dir -r requirements.txt && \
    rm -rf /root/.cache

# Final stage
FROM python:3.12-alpine
LABEL org.opencontainers.image.source="https://example.com/repo"
WORKDIR /opt/app
COPY --from=builder /usr/local /usr/local
COPY --from=builder /etc/passwd /etc/passwd
COPY app.py entrypoint.sh ./
USER 1000
EXPOSE 8080
# NOTE: add wget for healthcheck if you keep this healthcheck (runtime-time, not build-time)
# RUN apk add --no-cache wget
HEALTHCHECK --interval=30s --timeout=3s CMD wget -qO- http://127.0.0.1:8080/healthz || exit 1
ENTRYPOINT ["./entrypoint.sh"]
EOF

docker build -t local/api-python-flask:dev apps/api-python-flask
trivy image --exit-code 1 --severity CRITICAL local/api-python-flask:dev
mkdir -p sbom
syft packages local/api-python-flask:dev -o json > sbom/api-python-flask.json
conftest test --policy ci/conftest --all-namespaces apps/api-python-flask/Dockerfile
# Vulnerability scan (fails on CRITICAL)
trivy image --exit-code 1 --severity CRITICAL local/api-python-flask:dev
# SBOM (new Syft syntax)
mkdir -p sbom
syft scan image:local/api-python-flask:dev -o cyclonedx-json > sbom/api-python-flask.json
# Dockerfile policy check (OPA/Conftest)
conftest test --policy ci/conftest --all-namespaces apps/api-python-flask/Dockerfile
# Get actual digest for python:3.12-alpine
docker pull python:3.12-alpine
DIGEST=$(docker inspect --format='{{index .RepoDigests 0}}' python:3.12-alpine | sed 's/.*@//')
# Patch both FROM lines to use the digest
sed -i "s|^FROM --platform=\$BUILDPLATFORM python:3\.12-alpine AS builder|FROM --platform=\$BUILDPLATFORM python:3.12-alpine@${DIGEST} AS builder|" apps/api-python-flask/Dockerfile
sed -i "s|^FROM python:3\.12-alpine$|FROM python:3.12-alpine@${DIGEST}|" apps/api-python-flask/Dockerfile
# Rebuild
docker build -t local/api-python-flask:dev apps/api-python-flask
docker compose -f platform/compose/dev-stack.yaml up --build
# visit http://localhost:8080 (web → api path) 
# Ctrl+C to stop
RUN apk add --no-cache wget
docker compose -f platform/compose/dev-stack.yaml up --build
# visit http://localhost:8080 (web → api path) 
# Ctrl+C to stop
# create a minimal proxy Dockerfile + config
mkdir -p platform/compose/proxy
cat > platform/compose/proxy/Dockerfile <<'EOF'
FROM alpine:3.20
RUN apk add --no-cache tinyproxy
# minimal config: listen on 0.0.0.0:3128 and allow local subnets
RUN sed -i 's/^#Port .*/Port 3128/' /etc/tinyproxy/tinyproxy.conf && \
    sed -i 's/^#Listen .*/Listen 0.0.0.0/' /etc/tinyproxy/tinyproxy.conf && \
    sed -i 's/^Allow .*/# Allow 127.0.0.1/' /etc/tinyproxy/tinyproxy.conf && \
    printf "Allow 10.0.0.0/8\nAllow 172.16.0.0/12\nAllow 192.168.0.0/16\n" >> /etc/tinyproxy/tinyproxy.conf && \
    sed -i 's/^#DisableViaHeader.*/DisableViaHeader Yes/' /etc/tinyproxy/tinyproxy.conf && \
    sed -i 's/^#ConnectPort .*/ConnectPort 443/' /etc/tinyproxy/tinyproxy.conf && \
    sed -i 's/^#ConnectPort .*/ConnectPort 80/' /etc/tinyproxy/tinyproxy.conf
EXPOSE 3128
ENTRYPOINT ["tinyproxy","-d"]
EOF

cat > platform/compose/dev-stack.yaml <<'EOF'
services:
  proxy:
    build: ./proxy
    networks: [edge]
    ports:
      - "3128:3128"   # optional: expose to host for testing

  api:
    build: ../../apps/api-python-flask
    depends_on: [proxy]
    environment:
      - HTTPS_PROXY=http://proxy:3128
      - HTTP_PROXY=http://proxy:3128
      - NO_PROXY=localhost,127.0.0.1,api,web
    networks: [app]

  web:
    build: ../../apps/web-static-nginx
    depends_on: [api]
    networks: [app, edge]
    ports:
      - "8080:80"

networks:
  app: {}
  edge: {}
EOF

# add this line in apps/api-python-flask/Dockerfile (final stage)
# ... just before HEALTHCHECK
RUN apk add --no-cache wget
nano apps/api-python-flask/Dockerfile
cat > apps/api-python-flask/Dockerfile <<'EOF'
# Multi-stage: builder
FROM --platform=$BUILDPLATFORM python:3.12-alpine AS builder
WORKDIR /opt/app
RUN adduser -S -D -H -u 1000 appuser
COPY requirements.txt .
RUN apk add --no-cache gcc musl-dev libffi-dev && \
    pip install --no-cache-dir -r requirements.txt && \
    rm -rf /root/.cache

# Final stage
FROM python:3.12-alpine
LABEL org.opencontainers.image.source="https://example.com/repo"
WORKDIR /opt/app
COPY --from=builder /usr/local /usr/local
COPY --from=builder /etc/passwd /etc/passwd
COPY app.py entrypoint.sh ./
USER 1000
EXPOSE 8080
RUN apk add --no-cache wget
HEALTHCHECK --interval=30s --timeout=3s CMD wget -qO- http://127.0.0.1:8080/healthz || exit 1
ENTRYPOINT ["./entrypoint.sh"]
EOF

docker build -t local/api-python-flask:dev apps/api-python-flask
cat > apps/api-python-flask/Dockerfile <<'EOF'
# Multi-stage: builder
FROM --platform=$BUILDPLATFORM python:3.12-alpine AS builder
WORKDIR /opt/app
RUN adduser -S -D -H -u 1000 appuser
COPY requirements.txt .
RUN apk add --no-cache gcc musl-dev libffi-dev && \
    pip install --no-cache-dir -r requirements.txt && \
    rm -rf /root/.cache

# Final stage
FROM python:3.12-alpine
LABEL org.opencontainers.image.source="https://example.com/repo"
WORKDIR /opt/app
COPY --from=builder /usr/local /usr/local
COPY --from=builder /etc/passwd /etc/passwd
COPY app.py entrypoint.sh ./
# install healthcheck dependency while still root
RUN apk add --no-cache wget
USER 1000
EXPOSE 8080
HEALTHCHECK --interval=30s --timeout=3s CMD wget -qO- http://127.0.0.1:8080/healthz || exit 1
ENTRYPOINT ["./entrypoint.sh"]
EOF

docker build -t local/api-python-flask:dev apps/api-python-flask
docker compose -f platform/compose/dev-stack.yaml up --build
cat > apps/web-static-nginx/Dockerfile <<'EOF'
FROM nginx:1.27-alpine AS base
# create unprivileged user and install wget for HEALTHCHECK
RUN adduser -S -D -H -u 1000 webuser && apk add --no-cache wget
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /usr/share/nginx/html/index.html
USER 1000
EXPOSE 8080
HEALTHCHECK --interval=30s --timeout=5s CMD wget -qO- http://127.0.0.1:8080/healthz || exit 1
EOF

cat > apps/web-static-nginx/nginx.conf <<'EOF'
events {}
http {
  server {
    listen 8080;
    location / {
      root /usr/share/nginx/html;
      try_files $uri $uri/ =404;
    }
    location /healthz { return 200 "ok"; }
  }
}
EOF

# overwrite the compose file we created earlier
cat > platform/compose/dev-stack.yaml <<'EOF'
services:
  proxy:
    build: ./proxy
    networks: [edge]
    ports:
      - "3128:3128"   # optional: expose for testing

  api:
    build: ../../apps/api-python-flask
    depends_on: [proxy]
    environment:
      - HTTPS_PROXY=http://proxy:3128
      - HTTP_PROXY=http://proxy:3128
      - NO_PROXY=localhost,127.0.0.1,api,web
    networks: [app]

  web:
    build: ../../apps/web-static-nginx
    depends_on: [api]
    networks: [app, edge]
    ports:
      - "8080:8080"

networks:
  app: {}
  edge: {}
EOF

mkdir -p platform/compose/proxy
cat > platform/compose/proxy/Dockerfile <<'EOF'
FROM alpine:3.20
RUN apk add --no-cache tinyproxy
RUN sed -i 's/^#Port .*/Port 3128/' /etc/tinyproxy/tinyproxy.conf && \
    sed -i 's/^#Listen .*/Listen 0.0.0.0/' /etc/tinyproxy/tinyproxy.conf && \
    sed -i 's/^Allow .*/# Allow 127.0.0.1/' /etc/tinyproxy/tinyproxy.conf && \
    printf "Allow 10.0.0.0/8\nAllow 172.16.0.0/12\nAllow 192.168.0.0/16\n" >> /etc/tinyproxy/tinyproxy.conf && \
    sed -i 's/^#DisableViaHeader.*/DisableViaHeader Yes/' /etc/tinyproxy/tinyproxy.conf && \
    sed -i 's/^#ConnectPort .*/ConnectPort 443/' /etc/tinyproxy/tinyproxy.conf && \
    sed -i 's/^#ConnectPort .*/ConnectPort 80/' /etc/tinyproxy/tinyproxy.conf
EXPOSE 3128
ENTRYPOINT ["tinyproxy","-d"]
EOF

# Rebuild API (in case we changed it) and WEB
docker build -t local/api-python-flask:dev apps/api-python-flask
docker compose -f platform/compose/dev-stack.yaml up --build
cat > apps/web-static-nginx/nginx.conf <<'EOF'
events {}

http {
  # Logs (safe for containers)
  access_log /dev/stdout;
  error_log  /dev/stderr info;

  # Use writable temp paths for non-root
  client_body_temp_path /tmp/nginx/client_temp;
  proxy_temp_path       /tmp/nginx/proxy_temp;
  fastcgi_temp_path     /tmp/nginx/fastcgi_temp;
  uwsgi_temp_path       /tmp/nginx/uwsgi_temp;
  scgi_temp_path        /tmp/nginx/scgi_temp;

  server {
    listen 8080;
    location / {
      root /usr/share/nginx/html;
      try_files $uri $uri/ =404;
    }
    location /healthz { return 200 "ok"; }
  }
}
EOF

cat > apps/web-static-nginx/Dockerfile <<'EOF'
FROM nginx:1.27-alpine AS base
# create unprivileged user and deps
RUN adduser -S -D -H -u 1000 webuser && apk add --no-cache wget
# create writable temp/cache dirs for non-root
RUN mkdir -p /tmp/nginx/client_temp /tmp/nginx/proxy_temp /tmp/nginx/fastcgi_temp /tmp/nginx/uwsgi_temp /tmp/nginx/scgi_temp \
    && chown -R 1000:1000 /tmp/nginx
# copy config and content
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /usr/share/nginx/html/index.html
USER 1000
EXPOSE 8080
HEALTHCHECK --interval=30s --timeout=5s CMD wget -qO- http://127.0.0.1:8080/healthz || exit 1
EOF

docker compose -f platform/compose/dev-stack.yaml up --build
cat > apps/web-static-nginx/nginx.conf <<'EOF'
pid /tmp/nginx/nginx.pid;

events {}

http {
  access_log /dev/stdout;
  error_log  /dev/stderr info;

  # Writable temp paths for non-root
  client_body_temp_path /tmp/nginx/client_temp;
  proxy_temp_path       /tmp/nginx/proxy_temp;
  fastcgi_temp_path     /tmp/nginx/fastcgi_temp;
  uwsgi_temp_path       /tmp/nginx/uwsgi_temp;
  scgi_temp_path        /tmp/nginx/scgi_temp;

  server {
    listen 8080;
    location / {
      root /usr/share/nginx/html;
      try_files $uri $uri/ =404;
    }
    location /healthz { return 200 "ok"; }
  }
}
EOF

cat > apps/web-static-nginx/nginx.conf <<'EOF'
pid /tmp/nginx/nginx.pid;

events {}

http {
  access_log /dev/stdout;
  error_log  /dev/stderr info;

  # Writable temp paths for non-root
  client_body_temp_path /tmp/nginx/client_temp;
  proxy_temp_path       /tmp/nginx/proxy_temp;
  fastcgi_temp_path     /tmp/nginx/fastcgi_temp;
  uwsgi_temp_path       /tmp/nginx/uwsgi_temp;
  scgi_temp_path        /tmp/nginx/scgi_temp;

  server {
    listen 8080;
    location / {
      root /usr/share/nginx/html;
      try_files $uri $uri/ =404;
    }
    location /healthz { return 200 "ok"; }
  }
}
EOF

docker compose -f platform/compose/dev-stack.yaml up --build
# in Makefile
# replace sbom target with:
sbom:
	mkdir -p sbom && syft scan image:$(IMAGE) -o json > sbom/$(APP).json
make scan  APP=api-python-flask     # Trivy (fails on CRITICAL)
make sbom  APP=api-python-flask     # CycloneDX JSON
make policy.check                   # OPA/Conftest rules
git add .
git commit -m "feat: working compose (non-root nginx, /api proxy), sbom via syft scan"
git branch -M main
git remote add origin https://github.com/olagoldstx/dockerfile-security-playbook.git
git push -u origin main
git add .
git commit -m "feat: working compose (non-root nginx, /api proxy), sbom via syft scan"
git branch -M main
git remote add origin https://github.com/olagoldstx/dockerfile-security-playbook.git
git push -u origin main
git add .
git commit -m "feat: working compose (non-root nginx, /api proxy), sbom via syft scan"
git branch -M main
git remote add origin https://github.com/olagoldstx/dockerfile-security-playbook.git
git push -u origin main
git init
git config user.name "cloudlab"
git config user.email 107962449+Olagoldstx@users.noreply.github.com
git add .
git commit -m "feat: working compose (non-root nginx, /api proxy), SBOM via syft scan"
# Make sure the repo exists on GitHub: https://github.com/olagoldstx/dockerfile-security-playbook
# If it does, set the remote and push:
git branch -M main
git remote add origin https://github.com/olagoldstx/dockerfile-security-playbook.git
git push -u origin main
cd
cd ~
ls
# 1) (Optional) remove the Windows zone tag file
rm -f "$HOME/dockerfile-security-playbook-aws.zip:Zone.Identifier"
# 2) Install unzip (if needed) and extract
sudo apt update && sudo apt install -y unzip
unzip -q "$HOME/dockerfile-security-playbook-aws.zip" -d "$HOME"
# 3) Enter the project and verify contents
cd ~/dockerfile-security-playbook
ls
sudo apt install -y docker.io docker-compose trivy cosign conftest syft
sudo apt install -y wget
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key |   sudo gpg --dearmor -o /usr/share/keyrings/trivy.gpg
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb stable main" |   sudo tee /etc/apt/sources.list.d/trivy.list
sudo apt update
sudo apt install -y trivy
sudo apt install -y wget
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key |   sudo gpg --dearmor -o /usr/share/keyrings/trivy.gpg
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb stable main" |   sudo tee /etc/apt/sources.list.d/trivy.list
sudo apt update
sudo apt install -y trivy
# remove the broken trivy apt source if present
sudo rm -f /etc/apt/sources.list.d/trivy.list
sudo apt update
# basics
sudo apt install -y ca-certificates curl wget unzip
sudo apt install -y docker.io docker-compose
sudo usermod -aG docker $USER
newgrp docker   # (applies docker group now; otherwise relogin)
cd
cd ~/dockerfile-security-playbook
sudo apt install tree -y
tree -L 2 ~/dockerfile-security-playbook
cd ~/dockerfile-security-playbook
git status || git init
git add .
git commit -m "feat: working compose + SBOM + policies"
git branch -M main
git remote add origin https://github.com/olagoldstx/dockerfile-security-playbook.git 2>/dev/null || git remote set-url origin https://github.com/olagoldstx/dockerfile-security-playbook.git
git push -u origin main
cd aws/terraform
terraform init
terraform apply -auto-approve   -var region=us-east-1   -var org_prefix=acme   -var github_owner=olagoldstx   -var github_repo=dockerfile-security-playbook
cd ~/dockerfile-security-playbook
git remote -v
git fetch origin
# 1) Install & configure AWS CLI
sudo apt update && sudo apt install -y awscli
aws configure
# Paste your Access key ID, Secret, region (e.g., us-east-1), output json
# 2) Verify creds
aws sts get-caller-identity
# 3) Run terraform (from the repo’s terraform dir)
cd ~/dockerfile-security-playbook/aws/terraform
export AWS_REGION=us-east-1
terraform init
terraform apply -auto-approve   -var region=$AWS_REGION   -var org_prefix=acme   -var github_owner=olagoldstx   -var github_repo=dockerfile-security-playbook
exi
# set region (adjust if you prefer another)
export AWS_REGION=us-east-1
cd ~/dockerfile-security-playbook/aws/terraform
terraform init
terraform apply -auto-approve   -var region=$AWS_REGION   -var org_prefix=acme   -var github_owner=olagoldstx   -var github_repo=dockerfile-security-playbook
# set region (adjust if you prefer another)
export AWS_REGION=us-east-1
cd ~/dockerfile-security-playbook/aws/terraform
terraform init
terraform apply -auto-approve   -var region=$AWS_REGION   -var org_prefix=acme   -var github_owner=olagoldstx   -var github_repo=dockerfile-security-playbook
sudo apt update && sudo apt install -y awscli
aws --version
# create the files if missing
mkdir -p ~/.aws
# run the guided setup (use your NEWLY-ROTATED access key/secret)
aws configure --profile cloudlab
# AWS Access Key ID:  <new key>
# AWS Secret Access Key:  <new secret>
# Default region name:  us-east-1   # or your choice
# Default output format:  json
AWS_PROFILE=cloudlab aws sts get-caller-identity
cd ~/dockerfile-security-playbook/aws/terraform
export AWS_PROFILE=cloudlab
export AWS_REGION=us-east-1
export AWS_SDK_LOAD_CONFIG=1   # tells the SDK to honor the profile in ~/.aws/config
terraform init
terraform apply -auto-approve   -var region=$AWS_REGION   -var org_prefix=acme   -var github_owner=olagoldstx   -var github_repo=dockerfile-security-playbook
AllowAssumeIAMLabAdminRole
Customer inline
Inline
aws configure --profile cloudlab
AWS_PROFILE=cloudlab aws sts get-caller-identity
export AWS_PROFILE=cloudlab
export AWS_REGION=us-east-1
export AWS_SDK_LOAD_CONFIG=1
terraform init
terraform apply
aws iam attach-user-policy   --user-name cloudlab-user   --policy-arn arn:aws:iam::aws:policy/AdministratorAccess
cd ~/dockerfile-security-playbook/aws/terraform
export AWS_PROFILE=cloudlab
export AWS_REGION=us-east-1
export AWS_SDK_LOAD_CONFIG=1
terraform apply -auto-approve   -var region=$AWS_REGION   -var org_prefix=acme   -var github_owner=olagoldstx   -var github_repo=dockerfile-security-playbook
# ─────────────────────────────────────────────────────────────
# 🔐 KMS: split keys for ECR (symmetric) and Cosign (asymmetric)
# ─────────────────────────────────────────────────────────────
# Symmetric key for ECR encryption-at-rest
resource "aws_kms_key" "ecr_kms" {
}
# Asymmetric key for Cosign signing (image signatures/attestations)
resource "aws_kms_key" "cosign_kms" {
}
# Friendly alias for the Cosign signing key
resource "aws_kms_alias" "container_kms_alias" {
}
# ─────────────────────────────────────────────────────────────
# 🧺 ECR repository using the SYMMETRIC key
# ─────────────────────────────────────────────────────────────
resource "aws_ecr_repository" "api_python_flask" {
}
# (Optional) handy outputs
output "kms_key_arn_cosign" {
}
output "kms_key_arn_ecr" {
}
output "ecr_repo_uri_api_python_flask" {
}
cd ~/dockerfile-security-playbook/aws/terraform
# open the file in nano
nano main.tf
cd ~/dockerfile-security-playbook/aws/terraform
terraform fmt
terraform validate
terraform plan
terraform apply -auto-approve   -var region=us-east-1   -var org_prefix=acme   -var github_owner=olagoldstx   -var github_repo=dockerfile-security-playbook
cd ~/dockerfile-security-playbook/aws/terraform
grep -r "ecr_repo_uri_api_python_flask" .
nano main.tf
output "ecr_repo_uri_api_python_flask" {
}
nano outputs.tf
terraform fmt
terraform validate
terraform apply -auto-approve   -var region=us-east-1   -var org_prefix=acme   -var github_owner=olagoldstx   -var github_repo=dockerfile-security-playbook
mkdir -p .github/workflows
nano .github/workflows/build-and-push.yml
git add .github/workflows/build-and-push.yml
git commit -m "ci: add build, scan, push, and sign workflow"
git push
cd ~/dockerfile-security-playbook
# make sure the target dir exists
mkdir -p .github/workflows
# move the file
git mv aws/terraform/.github/workflows/build-and-push.yml .github/workflows/build-and-push.yml
git add -A
git commit -m "ci: move workflow to .github/workflows at repo root"
cd ~/dockerfile-security-playbook
# Add a sane .gitignore
cat > .gitignore <<'EOF'
# Terraform
**/.terraform/
**/.terraform/*
**/terraform.tfstate
**/terraform.tfstate.*
**/crash.log

# Optional: keep the lock file (recommended)
# !aws/terraform/.terraform.lock.hcl
EOF

# Untrack the bad files already committed
git rm --cached -r aws/terraform/.terraform
git rm --cached aws/terraform/terraform.tfstate aws/terraform/terraform.tfstate.backup
# Keep the lock file (good to commit)
git add .gitignore
git commit -m "chore: gitignore terraform state & provider dir; untrack state"
git fetch origin
git pull --rebase origin main
git push -u origin main
cd ~/dockerfile-security-playbook
# If a rebase is in progress, stop it
git rebase --abort || true
# Remove generated Terraform stuff that keeps tripping merges
rm -rf aws/terraform/.terraform
rm -f  aws/terraform/terraform.tfstate aws/terraform/terraform.tfstate.backup
# Make sure they’re ignored going forward (if not already)
cat > .gitignore <<'EOF'
**/.terraform/
**/terraform.tfstate
**/terraform.tfstate.*
**/crash.log
EOF

git add .gitignore
git commit -m "chore: ignore TF state/provider dirs" || true
git rebase --abort || true
# Remove generated Terraform stuff that keeps tripping merges
rm -rf aws/terraform/.terraform
rm -f  aws/terraform/terraform.tfstate aws/terraform/terraform.tfstate.backup
# Make sure they’re ignored going forward (if not already)
cat > .gitignore <<'EOF'
**/.terraform/
**/terraform.tfstate
**/terraform.tfstate.*
**/crash.log
EOF

git rebase --abort || true
# Remove generated Terraform stuff that keeps tripping merges
rm -rf aws/terraform/.terraform
rm -f  aws/terraform/terraform.tfstate aws/terraform/terraform.tfstate.backup
# Make sure they’re ignored going forward (if not already)
cat > .gitignore <<'EOF'
**/.terraform/
**/terraform.tfstate
**/terraform.tfstate.*
**/crash.log
EOF

git add .gitignore
git commit -m "chore: ignore TF state/provider dirs" || true
# repo root
cd ~/dockerfile-security-playbook
# make sure the workflow is at the repo root
test -f .github/workflows/build-and-push.yml && echo "workflow found ✅" || echo "workflow missing ❌"
cd ~/dockerfile-security-playbook
# 1) Update your view of the remote
git fetch origin
# 2) Rebase your local commits on top of origin/main
git rebase origin/main
# If Git shows conflicts:
#   - open each conflicted file, resolve <<<<<<< ======= >>>>>> markers
#   - then: git add <file>; git rebase --continue
# Repeat until rebase completes.
# 3) Push the rebased history (safe force)
git push -u origin main --force-with-lease
git fetch origin
git merge origin/main
# resolve conflicts if any (edit, then: git add -A; git commit)
git push -u origin main
printf "%s\n" "**/.terraform/" "**/terraform.tfstate" "**/terraform.tfstate.*" "**/crash.log" >> .gitignore
git add .gitignore
git commit -m "chore: ensure .terraform & tfstate ignored" || true
# try apt first (Ubuntu 24.04 usually has it)
sudo apt-get update && sudo apt-get install -y git-filter-repo ||   (python3 -m pip install --user git-filter-repo &&    echo 'export PATH=$HOME/.local/bin:$PATH' >> ~/.bashrc && source ~/.bashrc)
git filter-repo --force   --path-glob 'aws/terraform/.terraform/**'   --path 'aws/terraform/terraform.tfstate'   --path 'aws/terraform/terraform.tfstate.backup'   --invert-paths
git rev-list --objects --all | grep -E '\.terraform/|terraform\.tfstate' || echo "OK: not found"
git push origin main --force-with-lease
cd ~/dockerfile-security-playbook
# see current remotes (likely none)
git remote -v
# add (or reset) origin to your GitHub repo
git remote add origin https://github.com/olagoldstx/dockerfile-security-playbook.git 2>/dev/null || git remote set-url origin https://github.com/olagoldstx/dockerfile-security-playbook.git
# verify it’s reachable
git fetch origin
# push your main branch
git push -u origin main --force-with-lease
name: Build, Scan, Push, and Sign (ECR)
on:
permissions:
env:
jobs:
cd
~/dockerfile-security-playbook/.github/workflows/build-and-push.yml
cd ~/dockerfile-security-playbook/.github/workflows
nano build-and-push.yml
git add .github/workflows/build-and-push.yml
git commit -m "ci: export ECR_REPO_URI to job env and build from service dir"
git push
cd ~/dockerfile-security-playbook/.github/workflows
# 1️⃣ Stage the file you edited
git add build-and-push.yml
# 2️⃣ Commit it
git commit -m "ci: update workflow to include ECR_REPO_URI env and correct build path"
# 3️⃣ Push to GitHub
git push
nano ~/dockerfile-security-playbook/.github/workflows/build-and-push.yml
git add .github/workflows/build-and-push.yml
git commit -m "ci: fix ECR env export, build path, syft/cosign steps"
git push
cd
cd ~/dockerfile-security-playbook/.github/workflows
# See the modified file
git status
# Stage the workflow (note: no extra path prefix)
git add build-and-push.yml
# Commit it
git commit -m "ci: fix ECR env export, build path, syft/cosign steps"
# Push to GitHub
git push
sed -n '1,120p' build-and-push.yml
cd
cd ~/multi-cloud-iam-bootcamp
ls
ls -la
~/multi-cloud-iam-bootcamp
tree -L 2 ~/multi-cloud-iam-bootcamp
mkdir -p ~/multi-cloud-iam-bootcamp/{diagrams,anki}
nano aws/day2-iam-users-groups.md
git add aws/day2-iam-users-groups.md
git commit -m "Day2: AWS IAM users, groups, and policies lab"
git push
nano diagrams/day2-aws-iam-structure.mmd
nano anki/day2-aws-iam-flashcards.md
nano aws/day3-iam-roles-trust.md
git add aws/day3-iam-roles-trust.md
git commit -m "Day3: IAM roles and trust relationships"
git push
nano diagrams/day3-iam-trust-flow.mmd
nano anki/day3-iam-roles-flashcards.md
nano aws/day4-iam-best-practices.md
git add aws/day4-iam-best-practices.md
git commit -m "Day4: IAM best practices and permission boundaries"
git push
cd ~/multi-cloud-iam-bootcamp
# 1️⃣ Add everything in the repo (including diagrams, anki, aws)
git add .
# 2️⃣ Commit all the changes
git commit -m "Sync all Day1–Day4 labs, diagrams, and flashcards"
# 3️⃣ Push everything to GitHub
git push origin main
nano azure/day5-rbac-identity-protection.md
cd ~/multi-cloud-iam-bootcamp
mkdir -p azure
tree -L 1
nano azure/day5-rbac-identity-protection.md
git add azure/day5-rbac-identity-protection.md
git commit -m "Day5: Azure RBAC and Identity Protection lab"
git push
git add aws/day1-iam-foundations.md
git commit -m "Day1: IAM Foundations across clouds"
git push
git add .
git commit -m "Day1: IAM Foundations + diagram + flashcards"
git push
git add aws/day2-iam-users-groups.md
git commit -m "Day2: AWS IAM users, groups, and policies lab"
git push
git add .
git commit -m "Day2: AWS IAM users, groups, and policies"
git push
nano azure/day6-managed-identities-pim.md
git add azure/day6-managed-identities-pim.md
git commit -m "Day6: Azure Managed Identities and PIM"
git push
nano diagrams/day6-azure-managed-identities.mmd
nano anki/day6-azure-pim-flashcards.md
nano gcp/day7-iam-basics-service-accounts.md
cd ~/multi-cloud-iam-bootcamp
mkdir -p gcp
tree -L 1
nano gcp/day7-iam-basics-service-accounts.md
`nano diagrams/day7-gcp-iam-overview.mmd
nano diagrams/day7-gcp-iam-overview.mmd
nano anki/day7-gcp-iam-flashcards.md
git add gcp/day7-iam-basics-service-accounts.md
git commit -m "Day7: GCP IAM basics and service accounts"
git push
nano diagrams/day5-azure-rbac.mmd
nano anki/day5-azure-rbac-flashcards.md
nano diagrams/day6-azure-managed-identities.mmd
nano anki/day6-azure-pim-flashcards.md
**B. Anki**  
```bash
nano anki/day7-gcp-iam-flashcards.md

nano anki/day7-gcp-iam-flashcards.md
cd ~/multi-cloud-iam-bootcamp
git add anki diagrams
git commit -m "Add Mermaid + Anki for Days 5–7"
git push
git ls-files | egrep 'day[5-7].*(mmd|md)$'
nano gcp/day8-org-policies-custom-roles.md
git add gcp/day8-org-policies-custom-roles.md
git commit -m "Day8: GCP Org Policies and Custom Roles"
git push
nano diagrams/day8-gcp-org-policy.mmd
nano anki/day8-gcp-org-policy-flashcards.md
cd ~/multi-cloud-iam-bootcamp
# create diagram file
nano diagrams/day8-gcp-org-policy.mmd
nano anki/day8-gcp-org-policy-flashcards.md
git add diagrams/day8-gcp-org-policy.mmd anki/day8-gcp-org-policy-flashcards.md
git commit -m "Add Day8 GCP Org Policy diagram and Anki flashcards"
git push origin main
cd
cd ~/dockerfile-security-playbook/.github/workflows
cd
cd ~/dockerfile-security-playbook
nano .github/workflows/build-and-push.yml
git add .github/workflows/build-and-push.yml
git commit -m "ci: normalize ECR_REPO_URI and use cleaned value across build/scan/push/sign"
git push
git add .github/workflows/build-and-push.yml
git commit -m "ci: fix cosign KMS URI and sign by digest; normalize ECR repo URI"
git push
nano ~/dockerfile-security-playbook/.github/workflows/build-and-push.yml
git add .github/workflows/build-and-push.yml
git commit -m "ci: use KMS alias awskms:///alias/acme-cosign and verify access"
git push
nano ~/dockerfile-security-playbook/.github/workflows/build-and-push.yml
git add .github/workflows/build-and-push.yml
git commit -m "ci: rebuild full workflow for ECR build, scan, push, and KMS signing"
git push
cd
cd ~/multi-cloud-iam-bootcamp
nano diagrams/day8-gcp-org-policy.mmd
