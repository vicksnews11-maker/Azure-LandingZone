variable "lzbastionhost" {
  description = "Bastion host configuration"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))
}

variable subnet_id {
  description = "The ID of the subnet for the Bastion Host"
  type        = string
}
variable public_ip_address_id {
  description = "The ID of the public IP for the Bastion Host"
  type        = string
} 