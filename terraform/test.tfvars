tags = {
  "environment" = "test"
}

# resource group 

resource_group_name     = "test-resource-group"
resource_group_location = "uksouth"

# app service plan 

app_service_plan_name = "test-app-service-plan"

# app service  

app_service_name    = "test-app-service1234ur257432423"
os_type_webapp      = "Linux"
sku_name_webapp     = "B1"
dotnet_version      = "6.0"
authentication_type = "systemAssignedIdentity"

# mssql

sql_server_name            = "test-azure-sql-server18443"
sql_server_version         = "12.0"
sql_administrator_login    = "adminuser"
sql_administrator_password = "P@ssw0rd123"
sql_database_name          = "test-sql-database"
sql_collation              = "SQL_Latin1_General_CP1_CI_AS"
sql_license_type           = "BasePrice"
sql_max_size_gb            = 5
sql_read_scale             = false
sql_sku_name               = "S0"
sql_zone_redundant         = false
sql_vnet_integration       = "test"
connection_string_name     = "AZURE_SQL_CONNECTIONSTRING"

#  vnet

vnet_name              = "test-vnet"
vnet_address_space     = ["10.0.0.0/16"]
subnet_name1           = "subnet1"
subnet_address_prefix1 = ["10.0.1.0/24"]
subnet_name2           = "subnet2"
subnet_address_prefix2 = ["10.0.2.0/24"]

