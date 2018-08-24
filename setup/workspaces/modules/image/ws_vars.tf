resource "tfe_variable" "vault_azure_credentials_path_image" {
  key = "vault_azure_credentials_path"
  value = "${var.vault_azure_credentials_path}"
  category = "terraform"
  workspace_id = "${tfe_workspace.CreateImage.id}"
}

resource "tfe_variable" "service_name_image" {
  key = "service_name"
  value = "${var.service_name}"
  category = "terraform"
  workspace_id = "${tfe_workspace.CreateImage.id}"
}

resource "tfe_variable" "service_version_image" {
  key = "service_version"
  value = "${var.service_version}"
  category = "terraform"
  workspace_id = "${tfe_workspace.CreateImage.id}"
}

resource "tfe_variable" "network_ws_image" {
  key = "network_ws"
  value = "Network"
  category = "terraform"
  workspace_id = "${tfe_workspace.CreateImage.id}"
}

resource "tfe_variable" "organization_image" {
  key = "organization"
  value = "${var.organization}"
  category = "terraform"
  workspace_id = "${tfe_workspace.CreateImage.id}"
}


resource "tfe_variable" "VAULT_ADDR_image" {
  key = "VAULT_ADDR"
  value = "${var.vault_addr}"
  category = "env"
  workspace_id = "${tfe_workspace.CreateImage.id}"
}

resource "tfe_variable" "VAULT_TOKEN_image" {
  key = "VAULT_TOKEN"
  value = "${var.vault_token}"
  category = "env"
  workspace_id = "${tfe_workspace.CreateImage.id}"
  sensitive = true
}

resource "tfe_variable" "ARM_SUBSCRIPTION_ID_image" {
  key = "ARM_SUBSCRIPTION_ID"
  value = "${data.vault_generic_secret.azure.data["subscription_id"]}"
  category = "env"
  workspace_id = "${tfe_workspace.CreateImage.id}"
  sensitive = true
}

resource "tfe_variable" "ARM_CLIENT_SECRET_image" {
  key = "ARM_CLIENT_SECRET"
  value = "${data.vault_generic_secret.azure.data["client_secret"]}"
  category = "env"
  workspace_id = "${tfe_workspace.CreateImage.id}"
  sensitive = true
}

resource "tfe_variable" "ARM_CLIENT_ID_image" {
  key = "ARM_CLIENT_ID"
  value = "${data.vault_generic_secret.azure.data["client_id"]}"
  category = "env"
  workspace_id = "${tfe_workspace.CreateImage.id}"
  sensitive = true
}

resource "tfe_variable" "ARM_TENANT_ID_image" {
  key = "ARM_TENANT_ID"
  value = "${data.vault_generic_secret.azure.data["tenant_id"]}"
  category = "env"
  workspace_id = "${tfe_workspace.CreateImage.id}"
  sensitive = true
}

resource "tfe_variable" "CONFIRM_DESTROY_image" {
  key = "CONFIRM_DESTROY"
  value = "1"
  category = "env"
  workspace_id = "${tfe_workspace.CreateImage.id}"
  sensitive = true
}