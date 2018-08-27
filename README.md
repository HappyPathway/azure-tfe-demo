# tfe-demo

This repository is meant to serve as a standardized demo for Terraform Enterprise. Anybody interested in demonstrating features and functionality of Terraform Enterprise should be able to quickly eand easily setup a new organization and workspaces by following the documentation here.

## Credentials
The code in this repository assumes that values for credentials are stored in a Vault server. 

### Github Credentials
The credentials can be anywhere in Vault, but must have the following schema. 
The location of the credentials is specified by setting the vault_github_tokens variable. The Default location is secret/credentials/github. These credentials are used to setup a VCS Connection to your Terraform Enterprise Organization.
```json
{
    "key": "<oauth_app_client_id>",
    "secret": "<oauth_app_client_secret>"
}
```

### Azure Credentials
The credentials can be anywhere in Vault, but must have the following schema.
The location of the credentials is specified by setting the vault_azure_credentials_path variable. The Default location is secret/credentials/azure. These credentials are used as variables in the newly created workspaces as the workspaces work together to bake an image using Packer, and then launch into Azure.
```json
{
    "client_id": "${ARM_CLIENT_ID}",
    "client_secret": "${ARM_CLIENT_SECRET}",
    "subscription_id": "${ARM_SUBSCRIPTION_ID}",
    "tenant_id": "${ARM_TENANT_ID}"
}
```