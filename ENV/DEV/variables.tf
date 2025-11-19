#Resource Group variables--------------------
variable "lzrg" {
  description = "Map of resource groups to create"
  type = map(object({
    name     = string
    location = string
  }))
}

# virtual network variables------------------
variable "lzvnet" {
  description = "Configuration for the Virtual Network and its subnets"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    subnet_prefixes     = list(string)
    subnet_names        = list(string)
    vnet1               = { id = "/subscriptions/<sub>/resourceGroups/rg-vnet/providers/Microsoft.Network/virtualNetworks/vnet1" }
  }))
}

# Subnet variables---------------------------
variable "lzsubnet" {
  description = "A map of subnets to create"
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}

variable "subnet_ids" {
  description = "Map of subnet IDs for attaching resources"
  type        = map(string)
}

# Network Security Group variables---------
variable "lznsg" {
  description = "A map of network security groups to create"
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
  }))
}
# Storage Account variables---------------
variable "lzstg" {
  description = "Map of storage accounts to create"
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  }))
}
# Virtual Machine Variables---------------
variable "lznic" {
  description = "Map of NICs to create"
  type = map(object({
    location            = string
    resource_group_name = string
    subnet_id           = string
  }))
}
variable "lzvm" {
  description = "Map of VMs to create"
  type = map(object({
    location            = string
    resource_group_name = string
    vm_size             = string
    nic_name            = string
  }))
}
variable "prefix" {
  description = "Prefix for all resources"
  type        = string
}

variable "admin_username" {
  description = "Admin username for VMs"
  type        = string
}

variable "admin_password" {
  description = "Admin password for VMs"
  type        = string
  sensitive   = true
}
# Public IPs / Load Balancer variables-----
variable "lzlbpip" {
  type = object({
    name                = string
    location            = string
    resource_group_name = string
  })
}

variable "lzlb" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))
}

variable "frontend_ip_configuration_name" {
  type = string
}

variable "public_ip_id" {
  type = string
}
# Application Gateway variables-----------
variable "lzappgateway" {
  description = "Map of Application Gateways"
  type = map(object({
    name                  = string
    location              = string
    resource_group_name   = string
    subnet_id             = string
    capacity              = number
    frontend_port         = number
    cookie_based_affinity = string
    path                  = string
    backend_port          = number
    backend_protocol      = string
    request_timeout       = number
    listener_protocol     = string
    priority              = number
  }))
}
#Bastion Host variables--------------
variable "lzbastionhost" {
  description = "Bastion host configuration"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))
}
variable "subnet_id" {
  description = "The ID of the subnet for the Bastion Host"
  type        = string
}
variable "public_ip_address_id" {
  description = "The ID of the public IP for the Bastion Host"
  type        = string
}
#AKS Cluster variables--------------------
variable "lzaks" {
  description = "AKS configuration map passed to AKS module"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    dns_prefix          = string

    node_pool = object({
      name       = string
      node_count = number
      vm_size    = string
    })
  }))
}
# Key Vault variables-------------------
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
    tenant_id               = string
    object_id               = string
    key_permissions         = list(string)
    secret_permissions      = list(string)
    certificate_permissions = list(string)
  }))
}
#SQL Server variables-------------------
variable "lzsql" {
  description = "Map of MSSQL server configurations"
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
  }))
}
#SQL Database variables------------------
variable "lzsqldb" {
  description = "SQL Databases"
  type = map(object({
    name        = string
    server_key  = string
    sku_name    = string
    max_size_gb = number
  }))
}

variable "server_ids" {
  type = map(string)
}

#SQL Firewall Rules (optional) variables-----
variable "lzfirewall" {
  description = "Map of firewall rules"
  type = map(object({
    name     = string
    start_ip = string
    end_ip   = string
  }))
}

variable "lzsql" {
  description = "SQL server object"
  type        = any
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

# SQL Private Endpoint (optional) variables-----
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
  description = "Multiple private DNS zones"
  type = map(object({
    name                = string
    resource_group_name = string
  }))
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
