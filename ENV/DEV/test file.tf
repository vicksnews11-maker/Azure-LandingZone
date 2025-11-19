module "azurerm_kubernetes_cluster" {
  source = "./modules/azurerm_kubernetes_cluster"
  lzaks  = var.lzaks
  depends_on = [module.azurerm_resource_group, module.azurerm_subnet]
}

module "azurerm_key_vault" {
  source     = "./modules/azurerm_key_vault"
  lzkeyvault = var.lzkeyvault
  depends_on = [module.azurerm_resource_group]
}

module "azurerm_mssql_server" {
  source = "./modules/azurerm_mssql_server"
  lzsql  = var.lzsql
  depends_on = [module.azurerm_resource_group, module.azurerm_key_vault]
}

module "azurerm_mssql_database" {
  source  = "./modules/azurerm_mssql_database"
  lzsqldb = var.lzsqldb
  # the database objects include a `server_key` that references the key of an entry in lzsql
  sql_servers = module.azurerm_mssql_server.server_ids
  depends_on  = [module.azurerm_mssql_server]
}

module "azurerm_mssql_firewall_rule" {
  source     = "./modules/azurerm_mssql_firewall_rule"
  lzfirewall = var.lzfirewall
  sql_servers = module.azurerm_mssql_server.server_ids
  depends_on = [module.azurerm_mssql_server]
}

module "azurerm_private_dns_zone" {
  source   = "./modules/azurerm_private_dns_zone"
  lzdnsz   = var.lzdnsz
  depends_on = [module.azurerm_resource_group]
}

module "azurerm_private_endpoint_sql" {
  source   = "./modules/azurerm_private_endpoint_sql"
  lzpvt    = var.lzpvt
  lzpvt_sc = var.lzpvt_sc
  lzdnszg  = var.lzdnszg
  lzdnsz   = var.lzdnsz
  lzdnsvn  = var.lzdnsvn
  lzvnet   = var.lzvnet
  sql_servers = module.azurerm_mssql_server.server_ids
  depends_on = [module.azurerm_mssql_server, module.azurerm_subnet]
}
