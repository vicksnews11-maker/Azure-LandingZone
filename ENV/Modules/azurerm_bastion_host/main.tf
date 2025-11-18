resource "azurerm_bastion_host" "lz_bastion" {
  for_each            = var.lzbastionhost
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = "lz_bip-config"
    subnet_id            = module.azurerm_subnet.bastion_subnet.id
    public_ip_address_id = module.azurerm_public_ip.lz_publuc_ip.id
  }
}
