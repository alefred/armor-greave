param location string = 'eastus2'

resource stgbicep01d 'Microsoft.Storage/storageAccounts@2021-08-01' = { 
  name: 'stgbicepalf02'
  location: location 
  properties:{
    accessTier:'Cool'
  }
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  tags: {
    purpose: 'GlobalAzureLima'
  }
}

output stgid string = stgbicep01d.id
