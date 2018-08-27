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
Code from the deploy, image, and network modules will look for Github Environment Variables. These variables will be used by the github provider to clone the source repos and create new repos in 
specified users github account. 
```bash
export GITHUB_ORGANIZATION=${ORG}
export GITHUB_TOKEN=${TOKEN}
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

### Terraform Enterprise Credentials
These credentials are not stored in Vault, instead these are stored on the local system. Normally, users will create the API Token in Terraform and store in a ~/.terraformrc file. This file has the schema:
```hcl
credentials "app.terraform.io" {
  token = "<USER_API_TOKEN>"
}
```
This needs to be a User token and not an Org token. 

### Vault Credentials
It is expected to have VAULT_ADDR and VAULT_TOKEN set as your environment variables. The Terraform Vault Provider will use these variables to authentcate against the Vault server in order to look up the Github and Azure credentials.