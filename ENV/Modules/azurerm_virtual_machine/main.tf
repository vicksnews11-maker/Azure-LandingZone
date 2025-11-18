resource "azurerm_network_interface" "lz_nic" {
  for_each            = var.lznic
  name                = "${var.prefix}-${each.key}-nic"
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "ipconfig-${each.key}"
    subnet_id                     = each.value
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "lz_vm" {
  for_each              = var.lzvm
  name                  = "${var.prefix}-${each.key}-vm"
  location              = each.value.location
  resource_group_name   = each.value.resource_group_name
  network_interface_ids = [each.value.id]
  vm_size               = each.value.vm_size

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${each.key}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "${each.key}-host"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {
    environment = "staging"
  }
}
