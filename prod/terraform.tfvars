rgs = {
  rg1 = {
    rg_name     = "rg-prod-insiders"
    rg_location = "West US"
  }
}

storages = {
  sa1 = {
    sa_name                     = "distoragep7866"
    sa_rg_name                  = "rg-prod-insiders"
    sa_location                 = "eastus"
    sa_account_tier             = "Standard"
    sa_account_replication_type = "GRS"
  }
}
