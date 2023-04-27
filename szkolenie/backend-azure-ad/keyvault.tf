locals {
  passwords = [
    "secretvalue000",
    "secretvalue123",
    "secretvalue321",
    "secretvalue001",
    "secretvalue132"
  ]
}

resource "azurerm_key_vault" "zad2" {
  name                        = "zad2keyvault"
  location                    = data.azurerm_resource_group.default.location
  resource_group_name         = data.azurerm_resource_group.default.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"
    ]
  }
}

resource "azurerm_key_vault_secret" "passwords" {
  count = length(local.passwords)
  name         = "password-${count.index}"
  value        = local.passwords[count.index]
  key_vault_id = azurerm_key_vault.zad2.id
}