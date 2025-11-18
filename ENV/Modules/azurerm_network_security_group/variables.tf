variable "lznsg" {
  description = "A map of network security groups to create"
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
  }))
}