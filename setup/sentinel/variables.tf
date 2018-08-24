variable "organization" {
  type = "string"
  description = "Name of TFE Organization"
}

variable "disallowed_cidr_blocks" {
    type = "list"
    default = [
        "0.0.0.0/0",
        "*",
    ]
    description = "Disallowed Cidr Blocks"
}

variable "allowed_image_ids" {
    type = "list"
    default = [
        
    ]
    description = "Allowed Image IDs"
}

variable "allowed_vm_sizes" {
    type = "list"
    default = [

    ]
    description = "Allowed VM Sizes"
}
