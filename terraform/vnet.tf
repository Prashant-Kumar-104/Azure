resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name1
  address_prefixes     = var.subnet_address_prefix1
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.resource_group.name
  service_endpoints    = ["Microsoft.Storage.Global", "Microsoft.Sql", "Microsoft.Web"]
}

resource "azurerm_subnet" "subnet2" {
  name                 = var.subnet_name2
  resource_group_name  = azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_address_prefix2
  service_endpoints    = ["Microsoft.Storage.Global", "Microsoft.Sql", "Microsoft.Web"]
  delegation {
    name = "${var.subnet_name2}-delegation-subnet"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}
