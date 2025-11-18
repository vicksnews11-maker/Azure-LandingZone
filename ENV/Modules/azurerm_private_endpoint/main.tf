resource "azurerm_private_endpoint" "pvt_endpoint" {
  name                = var.lzpvt.name
  location            = var.lzpvt.location
  resource_group_name = var.lzpvt.resource_group_name
  subnet_id           = var.lzsubnet.id

  private_service_connection {
    name                           = var.lzpvt_sc.name
    private_connection_resource_id = var.lzpvt_sc.private_connection_resource_id
    subresource_names              = var.lzpvt_sc.subresource_names
    is_manual_connection           = var.lzpvt_sc.is_manual_connection
  }

  private_dns_zone_group {
    name                 = var.lzdnszg.name
    private_dns_zone_ids = [each.value.id]
  }
}

resource "azurerm_private_dns_zone" "dns_zone" {
  name                = var.lzdnsz.name
  resource_group_name = var.lzdnsz.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "dns" {
  name                  = var.lzdnsvn.name
  resource_group_name   = var.lzdnsvn.resource_group_name
  private_dns_zone_name = var.lzdnsvn.private_dns_zone_name
  virtual_network_id    = var.lzvnet.id
}
