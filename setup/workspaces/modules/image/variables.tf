variable "github_org" {
  default = "HappyPathway"
}


variable "create_image_repo" {
    default = "terraform-packer-salt-build"
  
}
variable "create_image_repo_branch" {
  default = "master"
}


variable "organization" {
  
}

variable "oauth_token" {
  
}

variable "vault_azure_credentials_path" {}
variable "vault_github_tokens" {}


variable "vault_token" {}

variable "vault_addr" {}

variable "service_name" {}
variable "service_version" {}

variable "repo_src_owner" {
  default = "HappyPathway"
  description = "Who owns the Source repos?"
}