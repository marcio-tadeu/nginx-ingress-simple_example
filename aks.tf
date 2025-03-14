resource "azurerm_resource_group" "rg-trial-payever" {
  name     = "rg-trial-payever"
  location = "West Europe"
}

resource "azurerm_kubernetes_cluster" "aks-trial-payever" {
  name                = "aks-trial-payever"
  location            = azurerm_resource_group.rg-trial-payever.location
  resource_group_name = azurerm_resource_group.rg-trial-payever.name
  dns_prefix          = "trial-payever-aks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.aks-trial-payever.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks-trial-payever.kube_config_raw

  sensitive = true
}