resource "tfe_organization" "organization" {
  name = "${var.organization}"
  email = "${var.organization_admin_email}"
}

resource "tfe_organization_token" "token" {
  organization = "${var.organization}"
  depends_on = [
    "tfe_organization.organization"
  ]
}

#resource "tfe_organization_vcs" "github" {
#  organization = "${var.organization}"
#  key = "${data.vault_generic_secret.github_tokens.data["key"]}"
#  secret = "${data.vault_generic_secret.github_tokens.data["secret"]}"
#  service_provider = "github"
#  http_url = "https://github.com"
#  api_url = "https://api.github.com"
#  depends_on = [
#    "tfe_organization.organization",
#    "tfe_organization_token.token"
#  ]
#}

data "template_file" "org_env" {
    vars = {
        token = "${tfe_organization_token.token.token}"
        org = "${var.organization}"
    }
    template = "${file("${path.module}/org_env.tpl")}"
}
resource "null_resource" "org_env" {
  triggers = {
      orgs = "template_file.org_env"
  }

  provisioner "local-exec" {
      command = "mkdir ~/.tfe/ || echo"
  }
  provisioner "local-exec" {
      command = "echo '${data.template_file.org_env.rendered}' > ~/.tfe/${var.organization}"
  }
}

