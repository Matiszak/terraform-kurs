#variable "object_set" {
#  type = map(object({name=string}))
#  default = { "a1_key" = { name: "a1" }, "a2_key" = { name: "a2" } }
#}
#
#resource "azurerm_resource_group" "name" {
#  for_each = var.object_set
#  name = each.value.name
#  location = data.azurerm_resource_group.default.location
#}
#
#locals {
#  #y1 = azurerm_resource_group.name["a1"]
#  #y2 = azurerm_resource_group.name["a2"]
#  z1 = azurerm_resource_group.name["a1_key"]
#  z2 = azurerm_resource_group.name["a2_key"]
#}