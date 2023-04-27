resource "azurerm_private_dns_zone" "zad6" {
  for_each = local.zones
  name                = each.value
  resource_group_name = data.azurerm_resource_group.default.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "zad6" {
  for_each = local.zones
  name                  = "zad6-dns-link-${each.key}"
  resource_group_name   = data.azurerm_resource_group.default.name
  private_dns_zone_name = azurerm_private_dns_zone.zad6[each.key].name
  virtual_network_id    = azurerm_virtual_network.zad2.id
}

resource "azurerm_private_dns_zone_virtual_network_link" "zad4kv" {
  name                  = "zad4kv-dns-link"
  resource_group_name   = data.azurerm_resource_group.default.name
  private_dns_zone_name = azurerm_private_dns_zone.zad6[each.key].name
  virtual_network_id    = azurerm_virtual_network.zad2.id
}