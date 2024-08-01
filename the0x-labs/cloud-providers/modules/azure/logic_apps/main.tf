resource "azurerm_resource_group" "logic_app" {
    name     = var.resource_group_name
    location = var.location
}

resource "azurerm_log_analytics_workspace" "logic_app_log_workspace" {
    name = "grc-log-workspace"
    location = azurerm_resource_group.logic_app.location
    resource_group_name = azurerm_resource_group.logic_app.name
    retention_in_days = 30
}

resource "azurerm_logic_app_workflow" "logic_app_workflow"{ 
    name                = var.logic_app_name
    location            = azurerm_resource_group.logic_app.location
    resource_group_name = azurerm_resource_group.logic_app.name
    enabled             = true
}
