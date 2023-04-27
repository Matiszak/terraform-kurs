terraform {
  required_providers {
    azurerm = {
      version = "=3.40.0"
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
    features {}
    subscription_id = "b82ba90e-f032-4013-8090-e31e88e71ed8"
}