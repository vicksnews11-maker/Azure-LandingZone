variable "lzfirewall" {
  type = object({
    name          = string
    server_key    = string
    start_ip      = string
    end_ip        = string
  })
}

variable "server_ids" {
  type = map(string)
}
