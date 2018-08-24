resource "tfe_workspace" "Network" {
  name = "Network"
  organization = "${var.organization}"
  vcs_repo = {
      identifier = "${var.github_org}/${var.network_repo}"
      branch = "${var.network_repo_branch}"
      oauth_token_id = "${var.oauth_token}"
      ingress_submodules = true
  }
}