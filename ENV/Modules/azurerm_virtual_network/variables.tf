variable "lzvnet" {
  description = "Configuration for the Virtual Network and its subnets"
    type = map(object({
    name           = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    # subnet_prefixes     = list(string)
    # subnet_names        = list(string)
  }))
} 