resource "azurerm_storage_account" "imported" {
  resource_group_name = data.azurerm_resource_group.default.name
  name = "mbstudent5imported"
  account_tier             = "Standard"
  account_replication_type = "RAGRS"
  location = data.azurerm_resource_group.default.location
}

resource "azurerm_storage_share" "zad4" {
  name                 = "zad4share"
  storage_account_name = azurerm_storage_account.imported.name
  quota                = 50

  #acl {
  #  id = "MTIzNDU2Nzg5MDEyMzQ1Njc4OTAxMjM0NTY3ODkwMTI"
#
  #  access_policy {
  #    permissions = "rwdl"
  #    start       = "2019-07-02T09:38:21.0000000Z"
  #    expiry      = "2019-07-02T10:38:21.0000000Z"
  #  }
  #}
}