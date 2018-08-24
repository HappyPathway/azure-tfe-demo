data "vault_generic_secret" "github_tokens" {
    path = "${var.vault_github_tokens}"
}


variable "organization" {
  
}

variable "organization_admin_email" {
  
}