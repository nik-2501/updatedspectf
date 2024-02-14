terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.92.0"
    }
  }
}

# Here we need to mention the Azure AD Application Object credentials to allow us to work with 
# our Azure account

provider "azurerm" {
  subscription_id = "b68f1f0c-238e-4808-b51e-c18ee2823409"
  client_id       = "0e7688aa-f042-4b8a-82c9-018b59f94b3b"
  client_secret   = "mCo8Q~x9CzQzwu_vTX8hpVbxlIaPb6oBFRqLJarM"
  tenant_id       = "8aeee858-5e38-4d2d-b5a9-e21262a965ca"
  features {}
}

resource "azurerm_resource_group" "newspecrg"{
  name="newspecrg" 
  location="East US"
}

# Here we are creating a storage account.
# The storage account service has more properties and hence there are more arguements we can specify here

resource "azurerm_storage_account" "storagespec1" {
  name                     = "storagespec1"
  resource_group_name      = "newspecrg"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "GRS"

}

#test