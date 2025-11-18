# Map of NICs to create
variable "lznic" {
  description = "Map of NICs to create"
  type = map(object({
    location            = string
    resource_group_name = string
    subnet_id           = string
  }))
}

# Map of VMs to create
variable "lzvm" {
  description = "Map of VMs to create"
  type = map(object({
    location            = string
    resource_group_name = string
    vm_size             = string
    nic_name            = string  # Must match key in lznic
  }))
}

# Prefix for naming resources
variable "prefix" {
  description = "Prefix for all resources"
  type        = string
}

# Admin credentials for VMs
variable "admin_username" {
  description = "Admin username for VMs"
  type        = string
}

variable "admin_password" {
  description = "Admin password for VMs"
  type        = string
  sensitive   = true
}

