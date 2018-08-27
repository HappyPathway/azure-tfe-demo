module "vault" {
    source = "./modules/vault"
    vault_github_tokens = "${var.vault_github_tokens}"
    vault_azure_credentials_path = "${var.vault_azure_credentials_path}"
    organization = "${var.organization}"
    service_name = "${var.service_name}"
}

module "network" {
    source = "./modules/network"
    github_org = "${var.github_org}"
    network_repo = "${var.network_repo}"
    network_repo_branch = "${var.network_repo_branch}"
    organization = "${var.organization}"
    oauth_token = "${var.oauth_token}"
    env = "${var.env}"
    vault_azure_credentials_path = "${var.vault_azure_credentials_path}"
    vault_github_tokens = "${var.vault_github_tokens}"
    vault_addr = "${var.vault_addr}"
}

module "image" {
    source = "./modules/image"
    github_org = "${var.github_org}"
    create_image_repo = "${var.create_image_repo}"
    create_image_repo_branch = "${var.create_image_repo_branch}"
    organization = "${var.organization}"
    oauth_token = "${var.oauth_token}"
    vault_addr = "${var.vault_addr}"
    vault_token = "${module.vault.vault_token}"
    network_ws = "${module.network.workspace_id}"
    vault_azure_credentials_path = "${var.vault_azure_credentials_path}"
    vault_github_tokens = "${var.vault_github_tokens}"
    service_name = "${var.service_name}"
    service_version = "${var.service_version}"
}

module "deploy" {
    source = "./modules/deploy"
    github_org = "${var.github_org}"
    deploy_image_repo = "${var.deploy_image_repo}"
    deploy_image_repo_branch = "${var.deploy_image_repo_branch}"
    organization = "${var.organization}"
    oauth_token = "${var.oauth_token}"
    vault_addr = "${var.vault_addr}"
    vault_token = "${module.vault.vault_token}"
    vault_azure_credentials_path = "${var.vault_azure_credentials_path}"
    vault_github_tokens = "${var.vault_github_tokens}"
    service_name = "${var.service_name}"
    service_version = "${var.service_version}"
    instance_size = "${var.instance_size}"
    env = "${var.env}"
}

module "admin_team" {
    organization = "${var.organization}"
    team_name = "${var.organization}-admin"
    source = "./modules/teams"
    workspaces = 3
    workspace_ids = [
        "${module.deploy.workspace_id}",
        "${module.network.workspace_id}",
        "${module.image.workspace_id}"
    ]
    team_permissions = "admin"
    members = "${var.admin_team_members}"
}

module "ops_team" {
    organization = "${var.organization}"
    team_name = "${var.organization}-ops"
    source = "./modules/teams"
    workspaces = 3
    workspace_ids = [
        "${module.deploy.workspace_id}",
        "${module.network.workspace_id}",
        "${module.image.workspace_id}"
    ]
    team_permissions = "write"
    members = "${var.ops_team_members}"
}

module "dev_team" {
    organization = "${var.organization}"
    team_name = "${var.organization}-dev"
    source = "./modules/teams"
    workspaces = 3
    workspace_ids = [
        "${module.deploy.workspace_id}",
        "${module.network.workspace_id}",
        "${module.image.workspace_id}"
    ]
    team_permissions = "read"
    members = "${var.dev_team_members}"
}