variable "lzpvt" {
  type = object({
    name                = string
    location            = string
    resource_group_name = string
  })
}

variable "lzsubnet" {
  type = object({
    id = string
  })
}

variable "lzpvt_sc" {
  type = object({
    name                           = string
    private_connection_resource_id = string
    subresource_names              = list(string)
    is_manual_connection           = bool
  })
}

variable "lzdnszg" {
  type = object({
    name                 = string
    private_dns_zone_ids = list(string)
  })
}

variable "lzdnsz" {
  type = object({
    name                = string
    resource_group_name = string
  })
}

variable "lzdnsvn" {
  type = object({
    name                  = string
    resource_group_name   = string
    private_dns_zone_name = string
  })
}

variable "lzvnet" {
  type = object({
    id = string
  })
}
