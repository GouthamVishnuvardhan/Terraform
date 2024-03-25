terraform {
   required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "=2.52.0"
    }
   }
}

provider "azurerm"{
    features{}
}

resource "azurerm_resource_group" "myrg"{
    name = "goutham-rg"
    location = "East US"
}

resource "azurerm_virtual_network" "myvnet"{
    name = "azure-vnet"
    resource_group_name = azurerm_resource_group.myrg.name
    location = azurerm_resource_group.myrg.location
    address_space = "[192.168.0.0/22]"
}

resource "azurerm_subnet" "mysubnet"{
    name = "main-snet"
    resource_group_name = azurerm_resource_group.myrg.name
    virtual_network_name = azurerm_virtual_network.myvnet.name
    address_prefixes = "[192.168.1.0/26]"
}

