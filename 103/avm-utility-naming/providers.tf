terraform {
  required_version = ">=1.9,<2.0"
  required_providers {
    alz = {
      source  = "azure/alz"
      version = "~>0.17"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "<5.0.0"
    }
    azapi = {
      source  = "Azure/azapi"
      version = "~>2.2.0"
    }
    modtmgr = {
      source  = "Azure/modtm"
      version = "~>0.3"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.6"
    }
    time = {
      source  = "hashicorp/time"
      version = "~>0.9.0"
    }
  }
  backend "azurerm" {}
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = var.subscription_id
}
