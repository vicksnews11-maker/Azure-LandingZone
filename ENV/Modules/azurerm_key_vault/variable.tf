variable "lzkeyvault" {
  description = "Map of Key Vaults to create"
  type = map(object({
    name                        = string
    resource_group_name         = string
    location                    = string
    sku_name                    = string
    tenant_id                   = string
    enabled_for_disk_encryption = bool
    soft_delete_enabled         = bool
    purge_protection_enabled    = bool
  }))
}

variable "lzkeyvault_access_policy" {
  description = "Key Vault access policy configuration"
  type = list(object({
    tenant_id    = string
    object_id    = string
    key_permissions = list(string)
    secret_permissions = list(string)
    certificate_permissions = list(string)
  }))
}