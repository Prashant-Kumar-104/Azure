resource "azurerm_app_service_source_control" "src2" {
  app_id   = azurerm_linux_web_app.serviceapp.id
  repo_url = "https://github.com/Prashant-Kumar-104/ASPNET-Core-6-with-Vite-and-Vue-3-Base-Template.git"
  branch   = "main"
}

resource "azurerm_source_control_token" "token12" {
  type  = "GitHub"
  token = "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"
}
