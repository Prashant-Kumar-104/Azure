resource "azurerm_service_plan" "serviceplan" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  os_type             = var.os_type_webapp
  sku_name            = var.sku_name_webapp
}

resource "azurerm_linux_web_app" "serviceapp" {
  name                = var.app_service_name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  service_plan_id     = azurerm_service_plan.serviceplan.id

  site_config {
    application_stack {
      dotnet_version = var.dotnet_version
    }
  }
  connection_string {
    name  = var.connection_string_name
    type  = "SQLServer"
    value = "Server=${azurerm_mssql_server.sqlserver01.fully_qualified_domain_name};Integrated Security=SSPI"
  }

}

resource "azurerm_app_service_virtual_network_swift_connection" "swiftconnection" {
  app_service_id = azurerm_linux_web_app.serviceapp.id
  subnet_id      = azurerm_subnet.subnet2.id
}

resource "azurerm_app_service_connection" "connectDB" {
  name               = var.connection_string_name
  app_service_id     = azurerm_linux_web_app.serviceapp.id
  target_resource_id = azurerm_mssql_database.sqldatabase01.id

  authentication {
    type = var.authentication_type
  }
}

