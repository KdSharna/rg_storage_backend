terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.38.0"
    }  
  }
  backend "azurerm" {
      resource_group_name  = "ponda1"
      storage_account_name = "tattu20"                  
      container_name       = "con99"            
      key                  = "prod.terraform.tfstate" 

    }
}
provider "azurerm" {
  features {}
  subscription_id = "3be29ba2-b31c-4fbd-a7bb-c51bf50ef740"
}
resource "azurerm_resource_group" "dadi41" {
  name     = "dada41"
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
