resource "azurerm_mssql_server" "lzsql" {
  for_each                = var.lzsql
  name                    = each.value.name
  resource_group_name     = each.value.resource_group_name
  location                = each.value.location
  version                 = each.value.version
  administrator_login     = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
  minimum_tls_version     = each.value.minimum_tls_version

  azuread_administrator {
    login_username = each.value.azuread_login_username
    object_id      = each.value.azuread_object_id
  }
}
