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
    location            = "West Europe"
    resource_group_name = "lz-rg1"
    address_space       = ["10.0.0.0/16"]
    subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24"]
    subnet_names        = ["subnet1", "subnet2"]
  }
}

# Subnets to create
lzsubnet = {
  subnet1 = {
    resource_group_name  = "lz-rg1"
    virtual_network_name = "lz-vnet"
    name                 = "lz-subnet1"
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
# Virtual Machine variables
prefix = "tfvm"

admin_username = "azureuser"
admin_password = "Password1234!"

lznic = {
  vm1 = {
    location            = "West Europe"
    resource_group_name = "rg-dev"
    subnet_id           = "/subscriptions/<SUBSCRIPTION_ID>/resourceGroups/rg-dev/providers/Microsoft.Network/virtualNetworks/vnet-dev/subnets/subnet1"
  }
  vm2 = {
    location            = "West Europe"
    resource_group_name = "rg-dev"
    subnet_id           = "/subscriptions/<SUBSCRIPTION_ID>/resourceGroups/rg-dev/providers/Microsoft.Network/virtualNetworks/vnet-dev/subnets/subnet2"
  }
}

lzvm = {
  vm1 = {
    location            = "West Europe"
    resource_group_name = "rg-dev"
    vm_size             = "Standard_B1s"
    nic_name            = "vm1"
  }
  vm2 = {
    location            = "West Europe"
    resource_group_name = "rg-dev"
    vm_size             = "Standard_B1s"
    nic_name            = "vm2"
  }
}


    
# Application Gateway
public_ip_id = "/subscriptions/xxxx/resourceGroups/my-rg/providers/Microsoft.Network/publicIPAddresses/my-pip"

lzappgateway = {
  agw1 = {
    name                  = "appgw1"
    location              = "West Europe"
    resource_group_name   = "my-rg"
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
  location            = "West Europe"
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
  location                 = "West Europe"
  resource_group_name      = "lz-rg1"
}

# Load Balancer 
 lzlbpip = {
  name                = "lz-lb-pip"
  location            = "West Europe"
  resource_group_name = "lz-resourcegroup"
}

lzlb = {
  lzlb-1 = {
    name                = "lzlb"
    location            = "West Europe"
    resource_group_name = "lz-rg1"
  }
}

