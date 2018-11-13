variable "vault_github_tokens" {
  description = "Path to GitHUb Tokens in Vault"
  default = "secret/credentials/github"
}

variable "vault_azure_credentials_path" {
  default = "secret/credentials/azure"
}
variable "github_org" {
  default = "HappyPathway"
}

variable "network_repo" {
  default = "terraform-azurerm-network"
}

variable "network_repo_branch" {
  default = "master"
}



variable "create_image_repo" {
    default = "terraform-packer-salt-build"
  
}
variable "create_image_repo_branch" {
  default = "master"
}


variable "deploy_image_repo" {
    default = "terraform-azure-server-pool"
}
variable "deploy_image_repo_branch" {
    default = "master"
  
}


variable "organization" {
  
}

variable "oauth_token" {
  
}

variable "env" {
  
}
variable "vault_addr" {
  
}

variable "instance_size" {
  default = "Standard_DS14-8_v2"
}
variable "service_name" {
  default = "redis-server"
}

variable "service_version" {
  default = "1.2.1"
}

variable "admin_team_members" {
  type = "list"
  default = ["darnold-hashi"]
}

variable "ops_team_members" {
  type = "list"
  default = ["darnold-op"]
}

variable "dev_team_members" {
  type = "list"
  default = ["darnold-dev"]
}

variable "tfe_hostname" {
  type = "string"
  default = "app.terraform.io"
}