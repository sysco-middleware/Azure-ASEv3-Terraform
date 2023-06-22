module "terraform_resource_group" {
  source = "../terraform_resource_group"

  resource_group_name     = var.resource_group_name
  resource_group_location = var.location
}

module "ase-vnet" {


  source              = "../ase-vnet"
  resource_group_name = module.terraform_resource_group.resource_group_name
  vnet_location       = module.terraform_resource_group.resource_group_location

  for_each           = var.custom_vnet_map
  vnet_name          = each.key
  vnet_address_space = each.value["vnet_address_space"]
  subnet_prefixes    = each.value["subnet_prefixes"]
  subnet_names       = each.value["subnet_names"]
  subnet_delegation  = var.subnet_delegation

}

module "vnet_peering" {
  depends_on = [ module.ase-vnet ]
  source                    = "../terraform_virtual_network_peering"
  count = var.enable_peering ? 1 : 0
  resource_group_name       = var.resource_group_name
  peering_name              = var.peering_name
  virtual_network_name      = var.virtual_network_name
  remote_virtual_network_id = data.azurerm_virtual_network.vnet.id
}

module "terraform_ase_v3" {
  depends_on          = [module.ase-vnet]
  source              = "../terraform_ase_v3"
  name                = local.ase_name
  resource_group_name = module.terraform_resource_group.resource_group_name
  subnet_id           = data.azurerm_subnet.ase_subnet.id
}

module "terraform_service_plan" {
  source                     = "../terraform_service_plan"
  name                       = "${var.service_prefix}-asp"
  location                   = module.terraform_resource_group.resource_group_location
  resource_group_name        = module.terraform_resource_group.resource_group_name
  os_type                    = "Linux"
  sku_name                   = "I1v2"
  app_service_environment_id = module.terraform_ase_v3.asev3_id
}

module "terraform_sa" {
  source                   = "../terraform_sa"
  name                     = "${var.service_prefix}storageacc"
  location                 = module.terraform_resource_group.resource_group_location
  resource_group_name      = module.terraform_resource_group.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

module "terraform_function_app" {
  source                     = "../terraform_function_app"
  name                       = "${var.service_prefix}func"
  location                   = module.terraform_resource_group.resource_group_location
  resource_group_name        = module.terraform_resource_group.resource_group_name
  storage_account_name       = data.azurerm_storage_account.sa.name
  storage_account_access_key = data.azurerm_storage_account.sa.primary_access_key
  service_plan_id            = module.terraform_service_plan.app_service_plan_id

  depends_on = [module.terraform_sa.storage_account_name]

  # site_config {}
}


# # https://github.com/Azure-Samples/app-service-web-dotnet-get-started

resource "azurerm_logic_app_standard" "logicapp" {
  name                       = "${var.service_prefix}la"
  location                   = module.terraform_resource_group.resource_group_location
  resource_group_name        = module.terraform_resource_group.resource_group_name
  app_service_plan_id        = module.terraform_service_plan.app_service_plan_id
  storage_account_name       = data.azurerm_storage_account.sa.name
  storage_account_access_key = data.azurerm_storage_account.sa.primary_access_key

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME"     = "node"
    "WEBSITE_NODE_DEFAULT_VERSION" = "~18"
  }

}

