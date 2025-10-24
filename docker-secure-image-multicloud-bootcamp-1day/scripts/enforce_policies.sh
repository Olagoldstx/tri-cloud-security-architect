#!/usr/bin/env bash
set -euo pipefail
if ! command -v hadolint >/dev/null 2>&1; then
  echo "Installing hadolint..." >&2
  curl -sL https://github.com/hadolint/hadolint/releases/latest/download/hadolint-Linux-x86_64 -o hadolint
  chmod +x hadolint && sudo mv hadolint /usr/local/bin/
fi
hadolint -c policies/hadolint.yaml Dockerfile

if ! command -v opa >/dev/null 2>&1; then
  echo "Installing OPA..." >&2
  curl -L -o opa https://openpolicyagent.org/downloads/latest/opa_linux_amd64
  chmod +x opa && sudo mv opa /usr/local/bin/
fi

# Very simple parser: feed Dockerfile instruction lines to OPA one-by-one
status=0
while IFS= read -r line; do
  instr=$(echo "$line" | awk '{{print $1}}' | tr '[:lower:]' '[:upper:]')
  val=$(echo "$line" | cut -d' ' -f2-)
  input=$(jq -n --arg i "$instr" --arg v "$val" '{{instruction:$i, value:$v}}')
  out=$(echo "$input" | opa eval -i /dev/stdin -d policies 'data.docker.security')
  echo "$out" | grep -q "deny" && status=1 || true
done < <(grep -E '^(FROM|USER|EXPOSE|HEALTHCHECK)' Dockerfile)

exit $status
