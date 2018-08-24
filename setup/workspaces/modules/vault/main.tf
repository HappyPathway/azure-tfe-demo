data "vault_generic_secret" "github_tokens" {
    path = "${var.vault_github_tokens}"
}

data "vault_generic_secret" "azure" {
    path = "${var.vault_azure_credentials_path}"
}

resource "vault_auth_backend" "approle" {
  type = "approle"
  path = "${var.organization}-demo"
}

resource "vault_approle_auth_backend_role" "example" {
  backend   = "${vault_auth_backend.approle.path}"
  role_name = "${var.organization}-demo"
  policies  = ["default", "${var.service_name}-demo"]
}

resource "vault_approle_auth_backend_role_secret_id" "id" {
  backend   = "${vault_auth_backend.approle.path}"
  role_name = "${vault_approle_auth_backend_role.example.role_name}"
}

resource "vault_approle_auth_backend_login" "login" {
  backend   = "${vault_auth_backend.approle.path}"
  role_id   = "${vault_approle_auth_backend_role.example.role_id}"
  secret_id = "${vault_approle_auth_backend_role_secret_id.id.secret_id}"
}

data "template_file" "vault_policy" {
    vars = {
        service_name = "${var.service_name}"
        vault_github_tokens = "${var.vault_github_tokens}"
        vault_azure_credentials_path = "${var.vault_azure_credentials_path}"
    }
    template = "${file("${path.module}/templates/vault_policy.tpl")}"
}

resource "vault_policy" "demo_tokens" {
    name = "${var.service_name}-demo"
    policy = "${data.template_file.vault_policy.rendered}"
}