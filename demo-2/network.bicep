param location string
param vnetname string

resource vnetd 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: vnetname
  location: location
}

output vnetId string = vnetd.id
