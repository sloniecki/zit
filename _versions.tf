terraform {
   backend "azurerm" {
    resource_group_name  = "remoteBackend"          
    storage_account_name = "1096terraformbackend"                              
    container_name       = "backend"                               
    key                  = "prod.terraform.tfstate"                


  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.0.0"
    }
  }
}

provider "azurerm" {
  features {}

}

