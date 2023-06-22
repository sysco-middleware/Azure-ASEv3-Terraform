data "azurerm_subnet" "ase_subnet" {
  depends_on = [
    module.terraform_resource_group.resource_group_name,
    module.ase-vnet
  ]
  name                 = var.ase_subnet
  virtual_network_name = var.ase_vnet
  resource_group_name  = module.terraform_resource_group.resource_group_name
}


data "azurerm_storage_account" "sa" {
  depends_on          = [module.terraform_sa]
  name                = local.sa_name
  resource_group_name = var.resource_group_name
}

data "azurerm_virtual_network" "vnet" {
  depends_on = [module.ase-vnet]
  name                = var.remote_virtual_network_name
  resource_group_name = var.resource_group_name
}