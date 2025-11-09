 param location string
 param subnetId string
 param nicName string

 resource nic 'Microsoft.Network/networkInterfaces@2021-02-01' = {
  name: nicName
  location: location
  properties: {
    ipConfigurations: [
          {
            name: 'ipconfig1'
            properties: {
              privateIPAllocationMethod: 'Dynamic'
              subnet: {
                id: subnetId
              }
            }
          }
        ]
  }
}


output nicId string = nic.id
