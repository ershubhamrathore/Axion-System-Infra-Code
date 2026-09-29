module "rg" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "vnet" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_virtual_network"
  vnets      = var.vnets
}

module "subnet" {
  depends_on = [module.vnet]
  source     = "../../modules/azurerm_subnet"
  subnets    = var.subnets
}

module "pips" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_public_ip"
  public_ips = var.public_ips
}

module "vms" {
  depends_on       = [module.subnet, module.pips]
  source           = "../../modules/azurerm_virtual_machine"
  virtual_machines = var.virtual_machines
}

module "postgressql" {
  depends_on         = [module.rg, module.subnet]
  source             = "../../modules/azurerm_postgres_flexible_server"
  postgresql_servers = var.postgresql_servers
}
