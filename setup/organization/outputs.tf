output "vcs_id" {
    value = "${tfe_organization_vcs.github.vcs_id}"
}

output "token" {
    value = "${tfe_organization_token.token.token}"
}

output "id" {
    value = "${tfe_organization_token.token.id}"
}

output "callback_url" {
    value = "${tfe_organization_vcs.github.callback_url}"
}