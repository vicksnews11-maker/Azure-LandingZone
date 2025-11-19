# Resource Groups
lzrg = {
  rg1 = {
    name     = "lz-rg1"
    location = "East US"
  }
  rg2 = {
    name     = "lz-rg2"
    location = "West Europe"
  }
}

# Storage Accounts
lzstg = {
  stg1 = {
    name                     = "lzstorageacct1"
    resource_group_name      = "lz-rg1"
    location                 = "East US"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
  stg2 = {
    name                     = "lzstorageacct2"
    resource_group_name      = "lz-rg2"
    location                 = "West Europe"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
}

# Virtual Network 
lzvnet = {
  vnet1 = {
    name                = "lz-vnet"
    location            = "East US"
    resource_group_name = "lz-rg1"
    address_space       = ["10.0.0.0/16"]
    subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24"]
    subnet_names        = ["subnet1", "subnet2"]
  }
}

# Subnets 
lzsubnet = {
  subnet1 = {
    name                 = "lz-subnet1"
    resource_group_name  = "lz-rg1"
    virtual_network_name = "lz-vnet"
    prefix               = "10.0.1.0/24"
  }
  subnet2 = {
    name                 = "lz-subnet2"
    resource_group_name  = "lz-rg1"
    virtual_network_name = "lz-vnet"
    prefix               = "10.0.2.0/24"
  }
}

# # Subnet IDs for attaching resources
subnet_ids = {
  subnet1 = "/subscriptions/<sub-id>/resourceGroups/landingzone-rg/providers/Microsoft.Network/virtualNetworks/lz-vnet/subnets/lz-subnet1"
  subnet2 = "/subscriptions/<sub-id>/resourceGroups/landingzone-rg/providers/Microsoft.Network/virtualNetworks/lz-vnet/subnets/lz-subnet2"
}

# Network Security Groups
lznsg = {
  nsg1 = {
    name                = "lz-nsg1"
    resource_group_name = "lz-rg1"
    location            = "East US"
  }
}
# Virtual Machine 
prefix = "tfvm"

admin_username = "azureuser"
admin_password = "Password1234!"

lznic = {
  vm1 = {
    location            = "East US"
    resource_group_name = "lz-rg1"
    subnet_id           = "/subscriptions/<SUBSCRIPTION_ID>/resourceGroups/rg-dev/providers/Microsoft.Network/virtualNetworks/vnet-dev/subnets/subnet1"
  }
  vm2 = {
    location            = "West Europe"
    resource_group_name = "lz-rg2"
    subnet_id           = "/subscriptions/<SUBSCRIPTION_ID>/resourceGroups/rg-dev/providers/Microsoft.Network/virtualNetworks/vnet-dev/subnets/subnet2"
  }
}

lzvm = {
  vm1 = {
    location            = "East US"
    resource_group_name = "lz-rg1"
    vm_size             = "Standard_B1s"
    nic_name            = "vm1"
  }
  vm2 = {
    location            = "West Europe"
    resource_group_name = "lz-rg2"
    vm_size             = "Standard_B1s"
    nic_name            = "vm2"
  }
}
# Application Gateway
public_ip_id = "/subscriptions/xxxx/resourceGroups/lz-rg1/providers/Microsoft.Network/publicIPAddresses/my-pip"

lzappgateway = {
  agw1 = {
    name                  = "appgw1"
    location              = "East US"
    resource_group_name   = "lz-rg1"
    subnet_id             = "/subscriptions/xxxx/resourceGroups/my-rg/providers/Microsoft.Network/virtualNetworks/my-vnet/subnets/subnet2"
    capacity              = 2
    frontend_port         = 80
    cookie_based_affinity = "Disabled"
    path                  = "/path1/"
    backend_port          = 80
    backend_protocol      = "Http"
    request_timeout       = 60
    listener_protocol     = "Http"
    priority              = 9
  }
}


# Bastion
lzbastionhost = {
  lzbastion1 = {
    name                = "lz-bastionhost"
    subnet_id           = "/subscriptions/<sub-id>/resourceGroups/landingzone-rg/providers/Microsoft.Network/virtualNetworks/lz-vnet/subnets/AzureBastionSubnet"
    public_ip_name      = "lz-bastion-pip"
    location            = "East US"
    resource_group_name = "lz-rg1"
  }
}

# Key Vault
lzkeyvault = {
  name                     = "lz-keyvault"
  sku_name                 = "standard"
  tenant_id                = "55c8923a-7f0f-438e-8c0d-5c66e8f91a5d"
  enable_soft_delete       = true
  purge_protection_enabled = false
  location                 = "East US"
  resource_group_name      = "lz-rg1"
}

# Load Balancer 
lzlbpip = {
  name                = "lz-lb-pip"
  location            = "East US"
  resource_group_name = "lz-rg1"
}

lzlb = {
  lzlb-1 = {
    name                = "lzlb"
    location            = "East US"
    resource_group_name = "lz-rg1"
  }
}
#----------------------
# AKS - two clusters
lzaks = {
  aks1 = {
    name                = "aks-1"
    location            = "East US"
    resource_group_name = "lz-rg1"
    dns_prefix          = "aks1"
    node_pool = {
      name       = "agentpool"
      node_count = 2
      vm_size    = "Standard_DS2_v2"
    }
  }
  aks2 = {
    name                = "aks-2"
    location            = "West Europe"
    resource_group_name = "lz-rg2"
    dns_prefix          = "aks2"
    node_pool = {
      name       = "agentpool"
      node_count = 1
      vm_size    = "Standard_DS2_v2"
    }
  }
}

# # Key Vaults
# lzkeyvault = {
#   kv1 = { name = "kv-1" location = "eastus" resource_group_name = "rg-kv" }
#   kv2 = { name = "kv-2" location = "eastus2" resource_group_name = "rg-kv" }
# }

# SQL Servers
lzsql = {
  sql1 = {
    name                         = "sqlserver1"
    location                     = "East US"
    resource_group_name          = "lz-rg1"
    version                      = "12.0"
    administrator_login          = "sqladmin"
    administrator_login_password = "P@ssw0rd123!"
    minimum_tls_version          = "1.2"
  }
  sql2 = {
    name                         = "sqlserver2"
    location                     = "West Europe"
    resource_group_name          = "lz-rg2"
    version                      = "12.0"
    administrator_login          = "sqladmin2"
    administrator_login_password = "P@ssw0rd456!"
    minimum_tls_version          = "1.2"
  }
}

# SQL Databases (each database points to a server_key from lzsql)
lzsqldb = {
  db1 = {
    name        = "appdb1"
    server_key  = "sql1"
    sku_name    = "S0"
    max_size_gb = 2
  }
  db2 = {
    name        = "appdb2"
    server_key  = "sql2"
    sku_name    = "S0"
    max_size_gb = 2
  }
}

server_ids = {
  sql1 = "/subscriptions/xxx/resourceGroups/rg1/providers/Microsoft.Sql/servers/sqlserver1"
  sql2 = "/subscriptions/xxx/resourceGroups/rg1/providers/Microsoft.Sql/servers/sqlserver2"
}

# Firewall rules per server
lzfirewall = {
  rule1 = {
    name     = "AllowHome"
    start_ip = "1.1.1.1"
    end_ip   = "1.1.1.1"
  }
  rule2 = {
    name     = "AllowOffice"
    start_ip = "2.2.2.2"
    end_ip   = "2.2.2.2"
  }

  lzsql = {
    id = "/subscriptions/xxxxx/resourceGroups/rg1/providers/Microsoft.Sql/servers/sqlserver1"
  }
}

# Private DNS zones
lzdnsz = {
  pdz1 = {
    name                = "privatelink.database.windows.net"
    resource_group_name = "lz-rg1"
  }
  pdz2 = {
    name                = "privatelink.other.windows.net"
    resource_group_name = "lz-rg2"
  }
}

# Private endpoints
lzpvt = {
  pvt1 = {
    name                = "pvt-sql1"
    location            = "East US"
    resource_group_name = "lz-rg1"
    subnet_id           = "/subscriptions/<sub>/resourceGroups/rg-vnet/providers/Microsoft.Network/virtualNetworks/vnet1/subnets/subnet1"
  }
}

lzpvt_sc = {
  pvt_sc = {
    name                           = "pvtsc-sql1"
    private_connection_resource_id = "/subscriptions/<sub>/resourceGroups/rg-sql/providers/Microsoft.Sql/servers/sqlserver1"
    subresource_names              = ["sqlServer"]
    is_manual_connection           = false
    server_key                     = "sql1"
  }
}

lzdnszg = {
  pvt1 = {
    name                 = "zonegroup1"
    private_dns_zone_key = "pdz1"
  }
}

# private dns zone virtual network links (if any)
lzdnsvn = {
  link1 = {
    name                  = "lzdnsvn1"
    resource_group_name   = "lz-rg1"
    private_dns_zone_name = "privatelink.database.windows.net"
    virtual_network_id    = "/subscriptions/<sub>/resourceGroups/rg-vnet/providers/Microsoft.Network/virtualNetworks/vnet1"
  }
}
