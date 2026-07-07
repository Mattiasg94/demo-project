# This project's own tasks. It declares its build/test environment (Dockerfile),
# so verification never depends on tools living in the agent's harness image.

.PHONY: test verify

# Run the suite directly (needs Go on the host).
test:
	go test ./...

# Run the suite in the declared environment — no host Go required. This is the
# shape the platform's verification step uses.
verify:
	docker build -t demo-project-verify .
	docker run --rm demo-project-verify
