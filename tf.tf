terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.38.0"
    }  
  }
  backend "azurerm" {
      resource_group_name  = "dadi41"
      storage_account_name = "kapi41"                  
      container_name       = "container41"            
      key                  = "prod.terraform.tfstate" 

    }
}
provider "azurerm" {
  features {}
  subscription_id = "f7d28834-9c52-41d7-adc6-8ae678eef59f"
}
resource "azurerm_resource_group" "dadi41" {
  name     = "dadi41"
  location = "east us"
}
resource "azurerm_storage_account" "stb41" {
  depends_on               = [azurerm_resource_group.dadi41]
  name                     = "kapi41"
  resource_group_name      = azurerm_resource_group.dadi41.name
  location                 = azurerm_resource_group.dadi41.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
