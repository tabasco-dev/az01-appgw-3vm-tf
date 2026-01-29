terraform {
  cloud {
    organization = "tabasco-tf"
    workspaces {
      name = "azure-projects-01"
    }
  }

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.58.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "c61f980b-b32a-46d4-aa51-e504f81a1842"
}

