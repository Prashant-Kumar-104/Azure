# Azure SQL Server
resource "azurerm_mssql_server" "sqlserver01" {
  name                         = var.sql_server_name
  location                     = azurerm_resource_group.resource_group.location
  resource_group_name          = azurerm_resource_group.resource_group.name
  version                      = var.sql_server_version
  administrator_login          = var.sql_administrator_login
  administrator_login_password = var.sql_administrator_password
}

# Azure SQL Database
resource "azurerm_mssql_database" "sqldatabase01" {

  name           = var.sql_database_name
  server_id      = azurerm_mssql_server.sqlserver01.id
  collation      = var.sql_collation
  license_type   = var.sql_license_type
  max_size_gb    = var.sql_max_size_gb
  read_scale     = var.sql_read_scale
  sku_name       = var.sql_sku_name
  zone_redundant = var.sql_zone_redundant
  tags           = var.tags
}

# Azure vnet integration with SQL
resource "azurerm_mssql_virtual_network_rule" "vnetintegration" {
  name      = var.sql_vnet_integration
  server_id = azurerm_mssql_server.sqlserver01.id
  subnet_id = azurerm_subnet.subnet.id
}
