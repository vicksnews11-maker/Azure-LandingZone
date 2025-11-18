variable "lzlbpip" {
  type = object({
    name                = string
    location            = string
    resource_group_name = string
  })
}

variable "lzlb" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))
}

variable "frontend_ip_configuration_name" {
  type = string
}

variable "public_ip_id" {
  type = string
}
