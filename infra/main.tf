resource "github_repository_ruleset" "main" {
  name        = "main-branch-protection"
  repository  = "demo-project"
  target      = "branch"
  enforcement = "active"

  conditions {
    ref_name {
      include = ["~DEFAULT_BRANCH"]
      exclude = []
    }
  }

  rules {
    deletion         = true
    non_fast_forward = true

    pull_request {
      required_approving_review_count = 0
    }

    required_status_checks {
      required_check {
        # Must equal the CI job name exactly, or the gate silently won't apply.
        context = "check"
      }
      strict_required_status_checks_policy = false
    }
  }
}
