targetScope = 'subscription'

@description('Specifies the location for resources.')
param location string = 'eastus2'

resource rgBicep00 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-bicep-00'
  location: location
}
