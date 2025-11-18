resource "azurerm_resource_group" "lz_rg" {
  for_each = var.lzrg
  name     = each.value.name
  location = each.value.location
}