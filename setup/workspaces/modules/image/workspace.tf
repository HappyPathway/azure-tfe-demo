resource "tfe_workspace" "CreateImage" {
  name = "CreateImage"
  organization = "${var.organization}"
  vcs_repo = {
      identifier = "${var.github_org}/${var.create_image_repo}"
      branch = "${var.create_image_repo_branch}"
      oauth_token_id = "${var.oauth_token}"
      ingress_submodules = true
  }
}