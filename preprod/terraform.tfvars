rgs = {
  rg1 = {
    rg_name     = "rg-axion-sandbox-ci-01"
    rg_location = "Central India"
  }
}

vnets = {
  vnet1 = {
    vnet_name           = "vnet-axion-sandbox-ci-01"
    location            = "Central India"
    resource_group_name = "rg-axion-sandbox-ci-01"
    address_space       = ["10.0.0.0/16"]
  }
}

subnets = {
  subnet1 = {
    subnet_name          = "frontend-subnet-axion-sandbox-ci-01"
    resource_group_name  = "rg-axion-sandbox-ci-01"
    virtual_network_name = "vnet-axion-sandbox-ci-01"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    subnet_name          = "backend-subnet-axion-sandbox-ci-01"
    resource_group_name  = "rg-axion-sandbox-ci-01"
    virtual_network_name = "vnet-axion-sandbox-ci-01"
    address_prefixes     = ["10.0.2.0/24"]
  }
  # subnet3 = {
  #   subnet_name          = "database-subnet-axion-sandbox-ci-01"
  #   resource_group_name  = "rg-axion-sandbox-ci-01"
  #   virtual_network_name = "vnet-axion-sandbox-ci-01"
  #   address_prefixes     = ["10.0.3.0/24"]
  # }
}

public_ips = {
  pip1 = {
    name                = "pip-frontend-vm-axion-sandbox-ci-01"
    resource_group_name = "rg-axion-sandbox-ci-01"
    location            = "Central India"
    allocation_method   = "Static"
  }
  pip2 = {
    name                = "pip-backend-vm-axion-sandbox-ci-01"
    resource_group_name = "rg-axion-sandbox-ci-01"
    location            = "Central India"
    allocation_method   = "Static"
  }
  # pip3 = {
  #   name                = "pip-database-vm-axion-sandbox-ci-01"
  #   resource_group_name = "rg-axion-sandbox-ci-01"
  #   location            = "Central India"
  #   allocation_method   = "Static"
  # }
}

virtual_machines = {
  vm1 = {
    vm_name              = "frontend-vm-axion-sandbox-ci-01"
    resource_group_name  = "rg-axion-sandbox-ci-01"
    location             = "Central India"
    vm_size              = "Standard_D2s_v3"
    admin_username       = "adminuser"
    admin_password       = "P@ssw0rd1234!"
    subnet_name          = "frontend-subnet-axion-sandbox-ci-01"
    virtual_network_name = "vnet-axion-sandbox-ci-01"
    nic_name             = "nic-frontend-vm-axion-sandbox-ci-01"
    public_ip_name       = "pip-frontend-vm-axion-sandbox-ci-01"
    nsg_name             = "nsg-frontend-vm-axion-sandbox-ci-01"
  }
  vm2 = {
    vm_name              = "backend-vm-axion-sandbox-ci-01"
    resource_group_name  = "rg-axion-sandbox-ci-01"
    location             = "Central India"
    vm_size              = "Standard_D2s_v3"
    admin_username       = "adminuser"
    admin_password       = "P@ssw0rd1234!"
    subnet_name          = "backend-subnet-axion-sandbox-ci-01"
    nic_name             = "nic-backend-vm-axion-sandbox-ci-01"
    virtual_network_name = "vnet-axion-sandbox-ci-01"
    public_ip_name       = "pip-backend-vm-axion-sandbox-ci-01"
    nsg_name             = "nsg-backend-vm-axion-sandbox-ci-01"
  }
  # vm3 = {
  #   vm_name              = "database-vm-axion-sandbox-ci-01"
  #   resource_group_name  = "rg-axion-sandbox-ci-01"
  #   location             = "Central India"
  #   vm_size              = "Standard_D2s_v3"
  #   admin_username       = "adminuser"
  #   admin_password       = "P@ssw0rd1234!"
  #   subnet_name          = "database-subnet-axion-sandbox-ci-01"
  #   nic_name             = "nic-database-vm-axion-sandbox-ci-01"
  #   virtual_network_name = "vnet-axion-sandbox-ci-01"
  #   public_ip_name       = "pip-database-vm-axion-sandbox-ci-01"
  #   nsg_name             = "nsg-database-vm-axion-sandbox-ci-01"
  # }
}

postgresql_servers = {
  pgsql1 = {
    server_name            = "pgsql-axion-sandbox-ci-03"
    resource_group_name    = "rg-axion-sandbox-ci-01"
    location               = "Central India"
    administrator_login    = "adminuser"
    administrator_password = "P@ssw0rd1234!"
    database_name          = "axiondb"
  }
}
