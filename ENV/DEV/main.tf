#Resource Group
module "azurerm_resource_group" {
  source = "../Modules/azurerm_resource_group"
  lzrg   = var.lzrg
}
#Virtual Network
module "azurerm_virtual_network" {
  source     = "../Modules/azurerm_virtual_network"
  depends_on = [module.azurerm_resource_group]
  lzvnet     = var.lzvnet
}
# Subnets
module "azurerm_subnet" {
  source     = "../Modules/azurerm_subnet"
  depends_on = [azurerm_virtual_network]
  lzsubnet   = var.lzsubnet
}
# Network Security Group
module "azurerm_network_security_group" {
  source     = "../Modules/azurerm_network_security_group"
  depends_on = [module.azurerm_resource_group]
  lznsg      = var.lznsg
}
#Storage Account
module "azurerm_storage_account" {
  source = "../Modules/azurerm_storage_account"
  lzstg  = var.lzstg
}
# Virtual Machine
module "azurerm_virtual_machine" {
  source         = "../modules/azurerm_virtual_machine"
  prefix         = var.prefix
  admin_username = var.admin_username
  admin_password = var.admin_password
  lznic          = var.lznic
  lzvm           = var.lzvm
}

output "nic_ids" {
  value = module.vm_deployment.nic_ids
}

output "vm_ids" {
  value = module.vm_deployment.vm_ids
}
# Public IPs / Load Balancer
module "azurerm_load_balancer" {
  source                         = "../Modules/azurerm_lb"
  lzlbpip                        = var.lzlbpip
  lzlb                           = var.lzlb
  frontend_ip_configuration_name = var.frontend_ip_configuration_name
  public_ip_id                   = var.lz_public_ip.id

}
# Application Gateway
module "azurerm_application_gateway" {
  source               = "../Modules/azurerm_application_gateway"
  lzappgateway         = var.lzappgateway
  public_ip_address_id = var.public_ip_id
}
#Bastion Host
module "azurerm_bastion_host" {
  source               = "../Modules/azurerm_bastion_host"
  lzbastionhost        = var.lzbastionhost
  subnet_id            = var.subnet_ids["bastion_subnet"]
  public_ip_address_id = var.lz_bastion_pip.id
}
#AKS Cluster
module "azurerm_kubernetes_cluster" {
  source = "../Modules/azurerm_kubernetes_cluster"

  lzaks = var.lzaks
  # Optional dependencies
  depends_on = [module.azurerm_resource_group, module.azurerm_subnet]
}
# Key Vault
module "azurerm_key_vault" {
  source                   = "../Modules/azurerm_key_vault"
  lzkeyvault               = var.lzkeyvault
  lzkeyvault_access_policy = var.lzkeyvault_access_policy
  depends_on               = [module.azurerm_resource_group]
}
#SQL Server
module "azurerm_mssql_server" {
  source = "../Modules/azurerm_mssql_server"
  lzsql  = var.lzsql
  # SQL Server depends on RG + KV (optional)
  depends_on = [module.azurerm_resource_group, module.azurerm_key_vault]
}
#SQL Database
module "azurerm_mssql_database" {
  source     = "../Modules/azurerm_mssql_database"
  lzsqldb    = var.lzsqldb
  server_id  = var.lzsql.id
  depends_on = [module.azurerm_mssql_server]
}
#SQL Firewall Rules (optional)
module "azurerm_mssql_firewall_rule" {
  source     = "../Modules/azurerm_mssql_firewall_rule"
  lzfirewall = var.lzfirewall
  lzsql      = var.lzsql
  depends_on = [module.azurerm_mssql_server]
}
# SQL Private Endpoint (optional) 
module "azurerm_private_endpoint_sql" {
  source     = "../Modules/azurerm_private_endpoint_sql"
  lzpvt      = var.lzpvt
  lzpvt_sc   = var.lzpvt_sc
  lzdnszg    = var.lzdnszg
  lzdnsz     = var.lzdnsz
  lzdnsvn    = var.lzdnsvn
  lzvnet     = var.lzvnet
  depends_on = [module.azurerm_mssql_server, module.azurerm_subnet]
}
