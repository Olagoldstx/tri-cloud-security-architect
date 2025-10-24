package docker.security

deny[msg] {
  input.instruction == "USER"
  not input.value
  msg := "Dockerfile must specify a non-root USER"
}

deny[msg] {
  input.instruction == "FROM"
  endswith(input.value, ":latest")
  msg := "Avoid using :latest tags"
}

warn[msg] {
  input.instruction == "EXPOSE"
  to_number(input.value) < 1024
  msg := "Avoid privileged ports (<1024)"
}
