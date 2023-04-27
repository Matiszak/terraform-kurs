variable "vnet_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "vnet_address_space" {
  type = string
}

variable "subnet_address_prefixes" {
  type = list(string)
}

locals {
    prefix = "mb-student5"
}

locals {
  zones = {
    "acr"       = "privatelink.azurecr.io"
    "file"      = "privatelink.file.core.windows.net"
    "keyvault"  = "privatelink.vaultcore.azure.net"
    "k8s"       = "privatelink.westeu.azmk8s.io"
    "postgesql" = "privatelink.postgres.database.azure.com"
  }
}