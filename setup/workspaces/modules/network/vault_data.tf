data "vault_generic_secret" "github_tokens" {
    path = "${var.vault_github_tokens}"
}

data "vault_generic_secret" "azure" {
    path = "${var.vault_azure_credentials_path}"
}