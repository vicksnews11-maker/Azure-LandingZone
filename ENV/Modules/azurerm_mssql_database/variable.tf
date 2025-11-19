variable "lzsqldb" {
  description = "SQL Databases"
  type = map(object({
    name         = string
    server_key   = string
    sku_name     = string
    max_size_gb  = number
  }))
}

variable "server_ids" {
  type = map(string)
}
