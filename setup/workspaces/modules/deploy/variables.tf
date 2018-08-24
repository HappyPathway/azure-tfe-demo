variable "github_org" {
  default = "HappyPathway"
}

variable "deploy_image_repo" {
    default = "azure-server-pool"
}
variable "deploy_image_repo_branch" {
    default = "master"
  
}


variable "organization" {
  
}

variable "oauth_token" {
  
}

variable "vault_azure_credentials_path" {}
variable "vault_github_tokens" {}
variable "vault_addr" {}

variable "vault_token" {}


variable "service_name" {}
variable "service_version" {}

variable "instance_size" {}

variable "env" {}