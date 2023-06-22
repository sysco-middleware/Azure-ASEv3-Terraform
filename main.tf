module "ase-poc" {
  source = "./modules/ase-poc"

  resource_group_name = var.resource_group_name
  location            = var.location
  service_prefix      = var.service_prefix

  vnet_location = var.location

  ase_vnet   = var.ase_vnet
  ase_subnet = var.ase_subnet

  custom_vnet_map   = var.custom_vnet_map
  subnet_delegation = var.subnet_delegation

  enable_peering = var.enable_peering
  peering_name = var.peering_name
  virtual_network_name = var.virtual_network_name
  remote_virtual_network_name = var.remote_virtual_network_name

}
