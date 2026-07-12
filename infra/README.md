# infra — branch protection as code

Terraform for the ruleset that requires CI to pass before merging to `main`.

Needs a fine-grained PAT scoped to `demo-project` with Administration: write,
and CI must have run once so the `check` context exists.

    export GITHUB_OWNER=Mattiasg94
    export GITHUB_TOKEN=<token>
    terraform init
    terraform plan
    terraform apply

State is gitignored; commit `.terraform.lock.hcl`.
