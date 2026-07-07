# Environment

This project declares the environment it needs to build and test itself, in its
own `Dockerfile`. The agent that edits this repo runs in a separate,
language-agnostic harness image that carries **no** Go toolchain — it only edits
files. Building and testing happen here, in the project's runtime.

Why the split: baking every language into one harness image doesn't scale and
breaks on polyglot repos. Instead, each project says what it needs (the way a
`devcontainer.json` or a CI config already does), and the platform layers
verification on top. New dependencies added to `go.mod` need no harness change —
the toolchain in the `Dockerfile` fetches them.

## Run the tests

- `make test` — directly, if you have Go on your host.
- `make verify` — in the declared environment (builds the image, runs the suite
  inside it); no host Go required. This is the shape the platform's verification
  step uses.

See platform `docs/adr/0008-project-declares-its-environment.md` for the decision.
