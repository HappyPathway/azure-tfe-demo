module "AzureImage" {
    source = "git@github.com:HappyPathway/terraform-github-repo-clone.git"
    repo_src = "HappyPathway/terraform-packer-salt-build"
    repo_dir = "/tmp/terraform-packer-salt-build"
    module = true
}

module "AzureNetwork" {
    source = "git@github.com:HappyPathway/terraform-github-repo-clone.git"
    repo_src = "HappyPathway/terraform-azurerm-network"
    repo_dir = "/tmp/terraform-azurerm-network"
}

module "AzureDeploy" {
    source = "git@github.com:HappyPathway/terraform-github-repo-clone.git"
    repo_src = "HappyPathway/azure-server-pool"
    repo_dir = "/tmp/azure-server-pool"
}