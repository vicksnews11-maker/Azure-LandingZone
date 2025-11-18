variable "lzsql" {
  description = "Map of MSSQL server configurations"
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
  }))
}

