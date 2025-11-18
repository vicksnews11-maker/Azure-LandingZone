resource "azurerm_mssql_database" "sqlbd" {
  name         = var.lzsqldb.name
  server_id    = var.server_id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"
  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}
