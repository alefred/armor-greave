param location string
param vnetname string
param addressSpace string = '192.168.0.0/24'
param subnets array

resource vnetd 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: vnetname
  location: location
  properties: {
    addressSpace:{
      addressPrefixes:[
        addressSpace
      ]
    }
  }
  resource subnetsd 'subnets' = [for item in subnets: {
    name: item.subnetName
    properties:{
      addressPrefix: item.subnetAddress
    }
  }]
}


output vnetId string = vnetd.id
// output subnetBackend array = vnetd.properties.subnets
