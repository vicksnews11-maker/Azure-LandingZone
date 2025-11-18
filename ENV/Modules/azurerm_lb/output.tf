output "public_ip_id" {
  value = azurerm_public_ip.lz_public_ip.id
}

output "lb_id" {
  value = { for k, v in azurerm_lb.lz_load_balancer : k => v.id }
}
