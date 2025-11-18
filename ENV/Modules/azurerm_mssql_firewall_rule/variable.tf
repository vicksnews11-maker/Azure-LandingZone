variable "lzfirewall" {
  description = "The name to use for the MSSQL Firewall Rule."
  type        = string
}
variable "lzsql" {
  description = "Configuration or object representing the MSSQL Server."
  type = object({
    id = string # We only explicitly need the 'id' attribute for the server_id argument
  })
}
variable "start_ip_address" {
  description = "The starting IP address for the firewall rule."
  type        = string
  default     = "10.0.17.62"
}
variable "end_ip_address" {
  description = "The ending IP address for the firewall rule."
  type        = string
  default     = "10.0.17.62"
}
