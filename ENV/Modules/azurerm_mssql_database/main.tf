resource "azurerm_mssql_database" "sqlbd" {
  for_each     = var.lzsqldb
  name         = each.value.name
  server_id    = var.server_ids[each.value.server_key]
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = each.value.max_size_gb
  sku_name     = each.value.sku_name
  enclave_type = "VBS"

  lifecycle {
    prevent_destroy = true
  }
}
