locals {
  location = "westeurope"
  snet_id = "/subscriptions/60415b52-6f99-42d1-8807-7a2eb5457dcf/resourceGroups/rg-network-core-we-01/providers/Microsoft.Network/virtualNetworks/vnet-network-core-we-01/subnets/paas"
  pdns_zone_id = "/subscriptions/60415b52-6f99-42d1-8807-7a2eb5457dcf/resourceGroups/rg-dns-core-we-01/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net"
  rg_name ="rg-avm-we-01"
  storage_account_name = "stoavmexwe001"
}

module "storage_account" {
  source  = "Azure/avm-res-storage-storageaccount/azurerm"
  version = "0.6.3"

  location            = local.location
  name                = local.storage_account_name
  resource_group_name = local.rg_name
  containers = {
    avm-container = {
      name = "avm-container"
    }
  }
  private_endpoints = {
    primary = {
      private_dns_zone_resource_ids = [local.pdns_zone_id]
      subnet_resource_id            = local.snet_id
      subresource_name              = "blob"
    }
  }
}