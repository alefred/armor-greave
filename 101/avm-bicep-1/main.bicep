targetScope = 'resourceGroup'
param location string = 'westeurope'
param snet_id string = '/subscriptions/60415b52-6f99-42d1-8807-7a2eb5457dcf/resourceGroups/rg-network-core-we-01/providers/Microsoft.Network/virtualNetworks/vnet-network-core-we-01/subnets/paas'
param pdns_zone_id string = '/subscriptions/60415b52-6f99-42d1-8807-7a2eb5457dcf/resourceGroups/rg-dns-core-we-01/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net'
param storage_account_name string = 'stoavmexwe001'

module storageAccount 'br/public:avm/res/storage/storage-account:0.29.0' = {
  name: 'storageAccountDeployment'
  params: {
    name: storage_account_name
    location: location
    blobServices: {
      containers: [
        {
          name: 'avm-container'
          publicAccess: 'None'
        }
      ]
    }
    privateEndpoints: [
      {
        privateDnsZoneGroup: {
          privateDnsZoneGroupConfigs: [
            {
              privateDnsZoneResourceId: pdns_zone_id
            }
          ]
        }
        service: 'blob'
        subnetResourceId: snet_id
      }
    ]
  }
}
