# since these variables are re-used - a locals block makes this more maintainable
# locals {
#   backend_address_pool_name      = "${azurerm_virtual_network.example.name}-beap"
#   frontend_port_name             = "${azurerm_virtual_network.example.name}-feport"
#   frontend_ip_configuration_name = "${azurerm_virtual_network.example.name}-feip"
#   http_setting_name              = "${azurerm_virtual_network.example.name}-be-htst"
#   listener_name                  = "${azurerm_virtual_network.example.name}-httplstn"
#   request_routing_rule_name      = "${azurerm_virtual_network.example.name}-rqrt"
#   redirect_configuration_name    = "${azurerm_virtual_network.example.name}-rdrcfg"
# }
resource "azurerm_application_gateway" "lz_appgateway" {
  for_each = var.lzappgateway

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = each.value.capacity
  }

  gateway_ip_configuration {
    name      = "${each.value.name}-gw-ipcfg"
    subnet_id = each.value.subnet_id
  }

  frontend_port {
    name = "${each.value.name}-feport"
    port = each.value.frontend_port
  }

  frontend_ip_configuration {
    name                 = "${each.value.name}-feip"
    public_ip_address_id = var.public_ip_address_id
  }

  backend_address_pool {
    name = "${each.value.name}-beap"
  }

  backend_http_settings {
    name                  = "${each.value.name}-be-htst"
    cookie_based_affinity = each.value.cookie_based_affinity
    path                  = each.value.path
    port                  = each.value.backend_port
    protocol              = each.value.backend_protocol
    request_timeout       = each.value.request_timeout
  }

  http_listener {
    name                           = "${each.value.name}-httplstn"
    frontend_ip_configuration_name = "${each.value.name}-feip"
    frontend_port_name             = "${each.value.name}-feport"
    protocol                       = each.value.listener_protocol
  }

  request_routing_rule {
    name                       = "${each.value.name}-rqrt"
    priority                   = each.value.priority
    rule_type                  = "Basic"
    http_listener_name         = "${each.value.name}-httplstn"
    backend_address_pool_name  = "${each.value.name}-beap"
    backend_http_settings_name = "${each.value.name}-be-htst"
  }
}
