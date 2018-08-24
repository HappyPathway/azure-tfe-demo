variable "members" {
    type = "list"
    description = "List of Team Members"
}

variable "team_name" {
    type = "string"
    description = "Name of Team"
}

variable "team_permissions" {
    type = "string"
    description = "Permissions of Team"
}

variable "workspace_ids" {
    type = "list"
    description = "Workspace ID"
}
variable "organization" {}