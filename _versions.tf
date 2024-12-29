terraform {
   backend "azurerm" {
    resource_group_name  = "remoteBackend"          
    storage_account_name = "1096terraformbackend"                              
    container_name       = "backend"                               
    key                  = "prod.terraform.tfstate"                
    client_id            = var.ARM_CLIENT_ID
    client_secret        = var.ARM_CLIENT_SECRET
    subscription_id      = var.ARM_SUBSCRIPTION_ID
    tenant_id            = var.ARM_TENANT_ID

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

