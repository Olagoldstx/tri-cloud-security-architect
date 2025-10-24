# Lab — Falco Runtime Threat Detection

## Goal
Run Falco locally and trigger a simple rule to observe alerts.

### Quickstart (containerized Falco)
```bash
docker run --rm -it   --privileged   -v /var/run/docker.sock:/var/run/docker.sock   -v /proc:/host/proc:ro   -v /boot:/host/boot:ro   -v /lib/modules:/host/lib/modules:ro   -v /usr:/host/usr:ro   falcosecurity/falco:latest
```
> Note: `--privileged` is required by Falco to access kernel events. Use only in lab environments.

### Trigger Suspicious Behavior
Open a new terminal and run a shell in the Alpine image:
```bash
docker run --rm -it   --entrypoint /bin/sh   secure-alpine-flask
```
Then try spawning another shell or touching sensitive paths:
```sh
id
cat /etc/shadow || true
apk add --no-cache curl || true
```
Observe Falco logs for rules like **Terminal shell in container** or **Read sensitive file untrusted**.

### Production Considerations
- Prefer Falco as a DaemonSet on Kubernetes with tuned rules.
- Send Falco outputs to SIEM (syslog, JSON to Fluent Bit, etc.).
