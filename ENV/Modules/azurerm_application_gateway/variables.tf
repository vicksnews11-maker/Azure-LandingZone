variable "lzappgateway" {
  description = "Map of Application Gateways to create"
  type = map(object({
    name                   = string
    location               = string
    resource_group_name    = string
    subnet_id              = string
    capacity               = number
    frontend_port          = number
    cookie_based_affinity  = string
    path                   = string
    backend_port           = number
    backend_protocol       = string
    request_timeout        = number
    listener_protocol      = string
    priority               = number
  }))
}

variable "public_ip_address_id" {
  description = "Public IP ID for frontend IP configuration"
  type        = string
}
