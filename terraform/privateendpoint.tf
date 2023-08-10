#private endpoint

resource "azurerm_private_endpoint" "pvtend01" {

  name                = "${azurerm_mssql_server.sqlserver01.name}-endpoint"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  subnet_id           = azurerm_subnet.subnet.id

  private_service_connection {

    name                           = "${azurerm_mssql_database.sqldatabase01.name}-privateconnection"
    private_connection_resource_id = azurerm_mssql_server.sqlserver01.id
    subresource_names              = ["SqlServer"]
    is_manual_connection           = false
  }

}
# private DNS
resource "azurerm_private_dns_zone" "pvtdns01" {

  name                = "privatelink.azurewebsites.net"
  resource_group_name = azurerm_resource_group.resource_group.name
}

#private DNS Link
resource "azurerm_private_dns_zone_virtual_network_link" "pvtdnsvnet01" {

  name                  = "${azurerm_mssql_server.sqlserver01.name}-dns-link12"
  resource_group_name   = azurerm_resource_group.resource_group.name
  private_dns_zone_name = azurerm_private_dns_zone.pvtdns01.name
  virtual_network_id    = azurerm_virtual_network.vnet.id
  registration_enabled  = false
}

