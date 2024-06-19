resource "azurerm_container_registry" "acr" {
  name                = "acrtrialpayever"
  resource_group_name = azurerm_resource_group.rg-trial-payever.name
  location            = azurerm_resource_group.rg-trial-payever.location
  sku                 = "Premium"
  admin_enabled       = false
  georeplications {
    location                = "East US"
    zone_redundancy_enabled = false
    tags                    = {}
  }

}