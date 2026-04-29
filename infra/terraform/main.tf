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