resource "azurerm_virtual_network" "zad2" {
  name                = "${local.prefix}-${var.vnet_name}"
  location            = data.azurerm_resource_group.default.location
  resource_group_name = data.azurerm_resource_group.default.name
  address_space       = [ var.vnet_address_space ]
  #dns_servers         = ["10.0.0.4", "10.0.0.5"]
}

resource "azurerm_subnet" "zad2" {
  name                 = "${local.prefix}-${var.subnet_name}"
  resource_group_name  = data.azurerm_resource_group.default.name
  virtual_network_name = azurerm_virtual_network.zad2.name
  address_prefixes     = var.subnet_address_prefixes
}