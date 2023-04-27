module "zad2_network_dev" {
  source = "./modules/zad2_network"

  rg_name = data.azurerm_resource_group.default.name
  location = data.azurerm_resource_group.default.location
  vnet_name = "${local.prefix}-zad2_network_dev"
  id-vnet-shared = azurerm_virtual_network.zad2.id
  name-vnet-shared = azurerm_virtual_network.zad2.name

  vnet_address_space = [ "10.1.0.0/16" ]
  sub_app_address_space = [ "10.1.1.0/24" ]
  sub_data_address_space =  [ "10.1.2.0/24" ]
  sub_endpoint_address_space = [ "10.1.3.0/24" ]


  providers = {
    azurerm.network = azurerm
  }
}

module "zad2_network_prod" {
  source = "./modules/zad2_network"

  rg_name = data.azurerm_resource_group.default.name
  location = data.azurerm_resource_group.default.location
  vnet_name = "${local.prefix}-zad2_network_prod"
  id-vnet-shared = azurerm_virtual_network.zad2.id
  name-vnet-shared = azurerm_virtual_network.zad2.name

  vnet_address_space = [ "10.2.0.0/16" ]
  sub_app_address_space = [ "10.2.1.0/24" ]
  sub_data_address_space =  [ "10.2.2.0/24" ]
  sub_endpoint_address_space = [ "10.2.3.0/24" ]


  providers = {
    azurerm.network = azurerm
  }
}