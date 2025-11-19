resource "azurerm_mssql_firewall_rule" "firewall" {
  name             = var.lzfirewall.name
  server_id        = var.server_ids[var.lzfirewall.server_key]
  start_ip_address = var.lzfirewall.start_ip
  end_ip_address   = var.lzfirewall.end_ip
}
