path "auth/token/create" {
  capabilities = ["update", "create", "read", "sudo"]
}

path "${vault_github_tokens}" {
    capabilities = ["read"]
}

path "${vault_azure_credentials_path}" {
    capabilities = ["read"]
}

path "secret/${service_name}/*" {
    capabilities = ["read", "list", "update", "create", "delete"]
}