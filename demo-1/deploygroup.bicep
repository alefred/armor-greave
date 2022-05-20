param location string = 'eastus2'

resource stgbicep01d 'Microsoft.Storage/storageAccounts@2021-08-01' = { 
  name: 'stgbicep01'
  location: location 
  properties:{
    accessTier:'Cool'
  }
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'BlobStorage'
  tags: {
    purpose: 'GlobalAzureLima'
  }
}

output stgid string = stgbicep01d.id
