# Lesson 07 — Capabilities & Seccomp

- Drop **ALL** capabilities and add back only what you must.
- Use custom `security/seccomp.json` and an AppArmor profile (`security/apparmor-profile`).
- Consider `--pids-limit` and `--memory` to reduce blast radius.
