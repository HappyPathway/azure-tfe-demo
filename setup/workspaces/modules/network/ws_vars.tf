resource "tfe_variable" "env" {
  key = "env"
  value = "${var.env}"
  category = "terraform"
  workspace_id = "${tfe_workspace.Network.id}"
}

resource "tfe_variable" "ARM_SUBSCRIPTION_ID" {
  key = "ARM_SUBSCRIPTION_ID"
  value = "${data.vault_generic_secret.azure.data["subscription_id"]}"
  category = "env"
  workspace_id = "${tfe_workspace.Network.id}"
  sensitive = true
}

resource "tfe_variable" "ARM_CLIENT_SECRET" {
  key = "ARM_CLIENT_SECRET"
  value = "${data.vault_generic_secret.azure.data["client_secret"]}"
  category = "env"
  workspace_id = "${tfe_workspace.Network.id}"
  sensitive = true
}

resource "tfe_variable" "ARM_CLIENT_ID" {
  key = "ARM_CLIENT_ID"
  value = "${data.vault_generic_secret.azure.data["client_id"]}"
  category = "env"
  workspace_id = "${tfe_workspace.Network.id}"
  sensitive = true
}

resource "tfe_variable" "ARM_TENANT_ID" {
  key = "ARM_TENANT_ID"
  value = "${data.vault_generic_secret.azure.data["tenant_id"]}"
  category = "env"
  workspace_id = "${tfe_workspace.Network.id}"
  sensitive = true
}

resource "tfe_variable" "CONFIRM_DESTROY" {
  key = "CONFIRM_DESTROY"
  value = "1"
  category = "env"
  workspace_id = "${tfe_workspace.Network.id}"
  sensitive = true
}