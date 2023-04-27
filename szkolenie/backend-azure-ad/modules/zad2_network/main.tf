resource "azurerm_virtual_network" "env" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = var.vnet_address_space
}

resource "azurerm_virtual_network_peering" "from-shared" {
  name                      = "${var.name-vnet-shared}-to-${azurerm_virtual_network.env.name}"
  resource_group_name       = var.rg_name
  virtual_network_name      = var.name-vnet-shared
  remote_virtual_network_id = azurerm_virtual_network.env.id
}

resource "azurerm_virtual_network_peering" "to-shared" {
  name                      = "${azurerm_virtual_network.env.name}-to-${var.name-vnet-shared}"
  resource_group_name       = var.rg_name
  virtual_network_name      = azurerm_virtual_network.env.name
  remote_virtual_network_id = var.id-vnet-shared
}

resource "azurerm_subnet" "app" {
  name                 = "app"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.env.name
  address_prefixes     = var.sub_app_address_space
}

resource "azurerm_subnet" "data" {
  name                 = "data"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.env.name
  address_prefixes     = var.sub_data_address_space

  delegation {
    name = "postgresql-delegation"

    service_delegation {
      name    = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
}

resource "azurerm_subnet" "endpoint" {
  name                 = "endpoint"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.env.name
  address_prefixes     = var.sub_endpoint_address_space
}

resource "azurerm_network_security_group" "nsgs" {
  for_each = toset([ "app", "data", "endpoint" ])
  name                = "nsg-${var.vnet_name}-${each.value}"
  location            = var.location
  resource_group_name = var.rg_name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "nsgs_associations" {
  for_each = { 
    "app" = azurerm_subnet.app,
    "data" = azurerm_subnet.data,
    "endpoint" = azurerm_subnet.endpoint
  }
  subnet_id                 = each.value.id
  network_security_group_id = azurerm_network_security_group.nsgs[each.key].id
}