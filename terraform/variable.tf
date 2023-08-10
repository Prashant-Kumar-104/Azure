# resource group
variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "app-service-rg"
}

variable "resource_group_location" {
  description = "Location of the Azure Resource Group"
  type        = string
  default     = "uksouth"
}

variable "tags" {
  description = "Tags for the Azure Resource Group"
  type        = map(string)
  default = {
    environment = "test"
  }
}

# app service plan

variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
  default     = "az-app-service-plan"
}

# app service

variable "app_service_name" {
  description = "Name of the Azure App Service"
  type        = string
  default     = "az-app-service-72167262"
}

variable "os_type_webapp" {
  default     = "Linux"
  description = "os type of webapp"
  type        = string
}
variable "sku_name_webapp" {
  default     = "B1"
  description = "sku type of webapp"
  type        = string
}
variable "dotnet_version" {
  default     = "6.0"
  description = "dotnet version of webapp"
  type        = string
}

#mssql
variable "sql_server_name" {
  description = "Name of the Azure SQL Server"
  type        = string
  default     = "az-sql-server"
}

variable "sql_server_version" {
  description = "Version of the Azure SQL Server"
  type        = string
  default     = "12.0"
}

variable "sql_administrator_login" {
  description = "Administrator login for the SQL Server"
  type        = string
  default     = "admin"
}

variable "sql_administrator_password" {
  description = "Administrator login password for the SQL Server"
  type        = string
  default     = "P@ssw0rd123"
}

variable "sql_database_name" {
  description = "Name of the Azure SQL Database"
  type        = string
  default     = "az-sql-database"
}

variable "sql_collation" {
  description = "Collation for the SQL Database"
  type        = string
  default     = "SQL_Latin1_General_CP1_CI_AS"
}

variable "sql_license_type" {
  description = "License type for the SQL Database"
  type        = string
  default     = "BasePrice"
}

variable "sql_max_size_gb" {
  description = "Maximum size in GB for the SQL Database"
  type        = number
  default     = 5
}

variable "sql_read_scale" {
  description = "Enable read scale for the SQL Database"
  type        = bool
  default     = false
}

variable "sql_sku_name" {
  description = "SKU name for the SQL Database"
  type        = string
  default     = "Basic"
}

variable "sql_zone_redundant" {
  description = "Enable zone redundancy for the SQL Database"
  type        = bool
  default     = false
}

variable "sql_vnet_integration" {
  description = "integration of vnet with sql"
  type        = string
  default     = "az"
}

variable "connection_string_name" {
  description = "connection string to connect to db and appservice"
  type        = string
  default     = "az"
}

variable "authentication_type" {
  description = "authentication type"
  default     = "systemAssignedIdentity"
}
# vnet


variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
  default     = "az-vnet"
}

variable "vnet_address_space" {
  description = "Address space for the Virtual Network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name1" {
  description = "List of subnet names"
  type        = string
  default     = "subnet-1"
}

variable "subnet_address_prefix1" {
  description = "List of subnet address prefixes"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}
variable "subnet_name2" {
  description = "List of subnet names"
  type        = string
  default     = "subnet-2"
}

variable "subnet_address_prefix2" {
  description = "List of subnet address prefixes"
  type        = list(string)
  default     = ["10.0.2.0/24"]
}

