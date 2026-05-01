resource "azurerm_resource_group" "main" {
  name     = "rg-${local.suffix}"
  location = var.location
}

module "networking" {
  source   = "./modules/networking"
  rg_name  = azurerm_resource_group.main.name
  location = var.location
  suffix   = local.suffix
}

module "vm" {
  source               = "./modules/vm"
  rg_name              = azurerm_resource_group.main.name
  location             = var.location
  suffix               = local.suffix
  frontend_subnet_id   = module.networking.frontend_subnet_id
  backend_subnet_id    = module.networking.backend_subnet_id
  ops_subnet_id        = module.networking.ops_subnet_id
  admin_ssh_public_key = var.admin_ssh_public_key
}

module "sql" {
  source             = "./modules/sql"
  rg_name            = azurerm_resource_group.main.name
  location           = var.location
  suffix             = local.suffix
  data_subnet_id     = module.networking.data_subnet_id
  vnet_id            = module.networking.vnet_id
  sql_admin_password = var.sql_admin_password
}

resource "azurerm_container_registry" "main" {
  name                = "acrproject2g6"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
}

module "appgateway" {
  source              = "./modules/appgateway"
  rg_name             = azurerm_resource_group.main.name
  location            = var.location
  suffix              = local.suffix
  gateway_subnet_id   = module.networking.gateway_subnet_id
  frontend_private_ip = module.vm.frontend_private_ip
  backend_private_ip  = module.vm.backend_private_ip
}

module "keyvault" {
  source                  = "./modules/keyvault"
  name                    = "kv-${local.suffix}"
  resource_group_name     = azurerm_resource_group.main.name
  location                = azurerm_resource_group.main.location
  suffix                  = local.suffix
  tenant_id               = data.azurerm_client_config.current.tenant_id
  virtual_network_id      = module.network.vnet_id
  ops_subnet_id           = module.network.ops_subnet_id
  ops_runner_principal_id = module.compute.ops_vm_principal_id
}