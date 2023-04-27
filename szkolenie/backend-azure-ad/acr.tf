resource "azurerm_container_registry" "zad5" {
  name                = "zad5acr"
  resource_group_name = data.azurerm_resource_group.default.name
  location            = data.azurerm_resource_group.default.location
  sku                 = "Premium"
  admin_enabled       = true
  public_network_access_enabled = false
}