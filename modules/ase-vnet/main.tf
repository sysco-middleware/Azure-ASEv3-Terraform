module "terraform_virtual_network" {

  source = "../terraform_virtual_network"

  resource_group_name = var.resource_group_name
  vnet_location       = var.vnet_location

  use_for_each = var.use_for_each

  address_space   = var.vnet_address_space
  vnet_name       = var.vnet_name
  subnet_prefixes = var.subnet_prefixes
  subnet_names    = var.subnet_names


  # nsg_ids = {
  #   subnet1 = azurerm_network_security_group.nsg1.id
  # }

  # subnet_service_endpoints = {
  #   subnet2 = ["Microsoft.Storage", "Microsoft.Sql"],
  #   subnet3 = ["Microsoft.AzureActiveDirectory"]
  # }

  subnet_delegation = var.subnet_delegation

  # route_tables_ids = {
  #   subnet1 = azurerm_route_table.rt1.id
  # }

  tags = var.tags

  # subnet_enforce_private_link_endpoint_network_policies = {
  #   subnet2 = true
  # }

  # subnet_enforce_private_link_service_network_policies = {
  #   subnet3 = true
  # }
}