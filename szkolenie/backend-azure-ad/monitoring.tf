#data "azurerm_monitor_diagnostic_categories" "zad2_keyvault_categories" {
#  resource_id = azurerm_key_vault.zad2.id
#}
#
#resource "azurerm_log_analytics_workspace" "default" {
#  name                = "acctest-01"
#  location            = azurerm_resource_group.default.location
#  resource_group_name = azurerm_resource_group.default.name
#  sku                 = "PerGB2018"
#  retention_in_days   = 30
#}
#
#resource "azurerm_monitor_diagnostic_setting" "analytics_workspace_settings" {
#  name               = "example"
#  target_resource_id = azurerm_key_vault.example.id
#  storage_account_id = azurerm_storage_account.example.id
#
#  dynamic "enabled_log" {
#    for_each = azurerm_monitor_diagnostic_categories.zad2_keyvault_categories.log_category_types
#    content {
#      category = enabled_log
#    
#      retention_policy {
#        enabled = false
#      }
#    }
#  }
#
#  metric {
#    category = "AllMetrics"
#
#    retention_policy {
#      enabled = false
#    }
#  }
#}