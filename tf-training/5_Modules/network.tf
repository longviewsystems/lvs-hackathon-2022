module "network" {
  source  = "Azure/network/azurerm"
  version = "3.5.0"
 
  resource_group_name = azurerm_resource_group.project.name
  address_space       = "10.1.0.0/16"
  subnet_prefixes     = ["10.1.0.0/24"]
  subnet_names        = ["subnet1"]
 
  depends_on = [
    azurerm_resource_group.project
  ]
}