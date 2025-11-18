resource "azurerm_public_ip" "lz_public_ip" {
  name                = var.lzlbpip.name
  location            = var.lzlbpip.location
  resource_group_name = var.lzlbpip.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_lb" "lz_load_balancer" {
  for_each            = var.lzlb
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  frontend_ip_configuration {
    name                 = var.frontend_ip_configuration_name
    public_ip_address_id = var.public_ip_id
  }
}

