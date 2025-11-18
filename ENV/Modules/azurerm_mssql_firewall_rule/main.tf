resource "azurerm_mssql_firewall_rule" "firewall" {
  name             = var.lzfirewall
  server_id        = var.lzsql.id
  start_ip_address = var.start_ip_address
  end_ip_address   = var.end_ip_address
}
