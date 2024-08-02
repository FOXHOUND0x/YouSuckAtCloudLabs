resource "azurerm_resource_provider_registration" "event_grid" {
    name = "Microsoft.EventGrid"
}

resource "azurerm_resource_provider_registration" "Web_grid" {
    name = "Microsoft.Web"
}