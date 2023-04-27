#resource "azurerm_private_link_service" "zad6acr" {
#  name                = "zad6acr-private-link"
#  location            = data.azurerm_resource_group.default.location
#  resource_group_name = data.azurerm_resource_group.default.name
#}

resource "azurerm_private_endpoint" "zad6acr" {
  name                = "zad6acr-private-endpoint"
  location            = data.azurerm_resource_group.default.location
  resource_group_name = data.azurerm_resource_group.default.name
  subnet_id           = azurerm_subnet.zad2.id

  private_service_connection {
    name                           = "zad6acr-privateserviceconnection"
    private_connection_resource_id = azurerm_container_registry.zad5.id
    is_manual_connection           = false
    subresource_names = [ "registry" ]
  }

  private_dns_zone_group {
    name = "zad6acr-private-endpoint-zone-group"
    private_dns_zone_ids = [ azurerm_private_dns_zone.zad6acr["acr"].id ]
  }
}