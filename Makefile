# This project's own tasks. It declares its build/test environment (Dockerfile),
# so verification never depends on tools living in the agent's harness image.

# So `make lint` finds golangci-lint under GOPATH/bin without a PATH tweak.
export PATH := $(shell go env GOPATH)/bin:$(PATH)

GOLANGCI_LINT_VERSION := v2.12.2

.PHONY: check ci fmt fmt-check vet lint test verify install-tools

# Local loop: auto-formats. `ci` is the same ladder but fails on unformatted
# code instead of rewriting it, because CI judges a finished artifact.
check: fmt vet lint test
ci: fmt-check vet lint test

fmt:
	gofmt -w .

fmt-check:
	@out="$$(gofmt -l .)"; \
	if [ -n "$$out" ]; then \
		echo "These files are not gofmt'ed:"; echo "$$out"; exit 1; \
	fi

vet:
	go vet ./...

lint:
	golangci-lint run

test:
	go test ./...

# Run the suite in the declared environment — no host Go required. This is the
# shape the platform's verification step uses.
verify:
	docker build -t demo-project-verify .
	docker run --rm demo-project-verify

install-tools:
	go install github.com/golangci/golangci-lint/v2/cmd/golangci-lint@$(GOLANGCI_LINT_VERSION)
