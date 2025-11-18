variable "lzrg" {
  description = "Map of resource groups to create"
  type = map(object({
    name     = string
    location = string
  }))
}
