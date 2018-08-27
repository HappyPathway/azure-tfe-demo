resource "tfe_variable" "vault_azure_credentials_path" {
  key = "vault_azure_credentials_path"
  value = "${var.vault_azure_credentials_path}"
  category = "terraform"
  workspace_id = "${tfe_workspace.DeployImage.id}"
}

resource "tfe_variable" "service_name" {
  key = "service_name"
  value = "${var.service_name}"
  category = "terraform"
  workspace_id = "${tfe_workspace.DeployImage.id}"
}

resource "tfe_variable" "service_version" {
  key = "service_version"
  value = "${var.service_version}"
  category = "terraform"
  workspace_id = "${tfe_workspace.DeployImage.id}"
}

resource "tfe_variable" "network_ws" {
  key = "network_ws"
  value = "AzureNetwork"
  category = "terraform"
  workspace_id = "${tfe_workspace.DeployImage.id}"
}

resource "tfe_variable" "organization" {
  key = "organization"
  value = "${var.organization}"
  category = "terraform"
  workspace_id = "${tfe_workspace.DeployImage.id}"
}

resource "tfe_variable" "vault_addr" {
  key = "vault_addr"
  value = "${var.vault_addr}"
  category = "terraform"
  workspace_id = "${tfe_workspace.DeployImage.id}"
  sensitive = true
}

resource "tfe_variable" "vault_token" {
  key = "vault_token"
  value = "${var.vault_token}"
  category = "terraform"
  workspace_id = "${tfe_workspace.DeployImage.id}"
  sensitive = true
}

resource "tfe_variable" "env" {
  key = "env"
  value = "${var.env}"
  category = "terraform"
  workspace_id = "${tfe_workspace.DeployImage.id}"
}

resource "tfe_variable" "instance_size" {
  key = "instance_size"
  value = "${var.instance_size}"
  category = "terraform"
  workspace_id = "${tfe_workspace.DeployImage.id}"
}

resource "tfe_variable" "VAULT_ADDR" {
  key = "VAULT_ADDR"
  value = "${var.vault_addr}"
  category = "env"
  workspace_id = "${tfe_workspace.DeployImage.id}"
}

resource "tfe_variable" "VAULT_TOKEN" {
  key = "VAULT_TOKEN"
  value = "${var.vault_token}"
  category = "env"
  workspace_id = "${tfe_workspace.DeployImage.id}"
  sensitive = true
}

resource "tfe_variable" "ARM_SUBSCRIPTION_ID" {
  key = "ARM_SUBSCRIPTION_ID"
  value = "${data.vault_generic_secret.azure.data["subscription_id"]}"
  category = "env"
  workspace_id = "${tfe_workspace.DeployImage.id}"
  sensitive = true
}

resource "tfe_variable" "ARM_CLIENT_SECRET" {
  key = "ARM_CLIENT_SECRET"
  value = "${data.vault_generic_secret.azure.data["client_secret"]}"
  category = "env"
  workspace_id = "${tfe_workspace.DeployImage.id}"
  sensitive = true
}

resource "tfe_variable" "ARM_CLIENT_ID" {
  key = "ARM_CLIENT_ID"
  value = "${data.vault_generic_secret.azure.data["client_id"]}"
  category = "env"
  workspace_id = "${tfe_workspace.DeployImage.id}"
  sensitive = true
}

resource "tfe_variable" "ARM_TENANT_ID" {
  key = "ARM_TENANT_ID"
  value = "${data.vault_generic_secret.azure.data["tenant_id"]}"
  category = "env"
  workspace_id = "${tfe_workspace.DeployImage.id}"
  sensitive = true
}

resource "tfe_variable" "CONFIRM_DESTROY" {
  key = "CONFIRM_DESTROY"
  value = "1"
  category = "env"
  workspace_id = "${tfe_workspace.DeployImage.id}"
  sensitive = true
}