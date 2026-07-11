# env is the source-free toolchain (the agent layers on it, so editing source
# doesn't bust its cache); verify adds source + tests. See ADR-0009.
FROM golang:1.23-bookworm AS env
WORKDIR /src

FROM env AS verify
COPY . .
CMD ["go", "test", "./..."]
