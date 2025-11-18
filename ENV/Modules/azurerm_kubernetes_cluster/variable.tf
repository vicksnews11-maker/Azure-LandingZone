variable "lzaks" {
  description = "AKS configuration map for multiple clusters (for_each)"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string     # Required RG
    dns_prefix          = string     # DNS prefix for AKS
    
    node_pool = object({
      name       = string
      node_count = number
      vm_size    = string
    })
  }))
}
