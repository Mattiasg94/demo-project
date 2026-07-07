# This project declares its own build/test environment.
#
# The agent's harness image is deliberately language-agnostic — it edits files
# but carries no Go. What it needs to build and test this code lives *here*, with
# the code, so verification runs in the project's own runtime (see ENVIRONMENT.md
# and platform ADR-0008). Adding a dependency to go.mod just works: the toolchain
# below fetches it, no harness change.
FROM golang:1.23-bookworm
WORKDIR /src
COPY . .
# Default: run the suite. The platform's verification step runs this image.
CMD ["go", "test", "./..."]
