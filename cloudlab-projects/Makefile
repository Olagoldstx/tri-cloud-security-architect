# CloudLab Makefile — quick muscle-memory targets
# Requires: ~/scripts/bootstrap_cloudlab.sh, ~/scripts/teardown_cloudlab.sh

SHELL := /bin/bash
CLUSTER ?= cloudlab
NODE_IMAGE ?= kindest/node:v1.30.0

.PHONY: help bootstrap up status kubectl down clean clean-deep export compact

help:
	@echo "Targets:"
	@echo "  make bootstrap   - Install/verify toolchain (kubectl, terraform, awscli, kind, helpers)"
	@echo "  make up          - Create kind cluster ($(CLUSTER))"
	@echo "  make status      - Show Docker/K8s/Terraform/AWS status"
	@echo "  make kubectl     - Print current k8s context/nodes"
	@echo "  make down        - Delete all kind clusters"
	@echo "  make clean       - Safe docker prune (dangling stuff)"
	@echo "  make clean-deep  - Aggressive docker prune (ALL images/volumes)"
	@echo "  make export      - Export WSL distro to tar (Windows PowerShell step shown)"
	@echo "  make compact     - Print Windows PowerShell commands to compact WSL disk"

bootstrap:
	@bash ./scripts/bootstrap_cloudlab.sh

up:
	@cloudlab-kind-up $(CLUSTER) $(NODE_IMAGE)

status:
	@cloudlab-status

kubectl:
	@kubectl config get-contexts || true
	@kubectl get nodes -o wide || true
	@kubectl get pods -A | head -n 30 || true

down:
	@bash ~/scripts/teardown_cloudlab.sh

clean:
	@bash ~/scripts/teardown_cloudlab.sh

clean-deep:
	@bash ~/scripts/teardown_cloudlab.sh --deep

export:
	@echo
	@echo "Run this in **Windows PowerShell (Admin)** to export the WSL image:"
	@echo "  wsl --export Ubuntu-24.04 C:\\Backups\\Ubuntu24.tar"

compact:
	@echo
	@echo "Run this in **Windows PowerShell (Admin)** to shutdown & compact WSL:"
	@echo "  wsl --shutdown"
	@echo "  wsl --manage Ubuntu-24.04 --compact"
