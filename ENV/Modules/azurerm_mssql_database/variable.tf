variable "lzsqldb" {
  description = "Configuration object for the SQL database."
  type = object({
    name = string
    # Include other expected fields if necessary
  })
}

variable "server_id" {
  description = "The ID of the SQL Server."
  type        = string
}