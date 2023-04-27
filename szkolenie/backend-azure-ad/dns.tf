resource "azurerm_private_dns_zone" "zad6acr" {
  for_each = local.zones
  name                = each.value
  resource_group_name = data.azurerm_resource_group.default.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "zad6acr" {
  for_each = local.zones
  name                  = "zad6acr-dns-link-${each.key}"
  resource_group_name   = data.azurerm_resource_group.default.name
  private_dns_zone_name = azurerm_private_dns_zone.zad6acr[each.key].name
  virtual_network_id    = azurerm_virtual_network.zad2.id
}