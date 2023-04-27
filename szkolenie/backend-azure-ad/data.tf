data "azurerm_resource_group" "default" {
    name = "mb-student5"
}

data "azurerm_client_config" "current" {
}