output "vault_token" {
    value = "${vault_approle_auth_backend_login.login.client_token}"
}
