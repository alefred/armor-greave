targetScope = 'subscription'

param location string = 'eastus2'
param projectName string
param vmUser string
@secure()
param vmPassword string

var vnetName = 'vnet-${projectName}-${uniqueString(projectName)}'
var vmName = 'vm-${projectName}-${uniqueString(projectName)}'
var nicName = 'nic-${projectName}-${uniqueString(projectName)}'

resource rgbicep01d 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-bicep-04'
  location: location
}

module vnetm 'Network/virtualNetworks.bicep' = {
  scope: rgbicep01d
  name: 'vnetd'
  params: {
    location: location
    vnetname: vnetName
    addressSpace: '192.168.0.0/16'
    subnets: [
      {
        subnetName: 'backend'
        subnetAddress: '192.168.1.0/24'
      }
      {
        subnetName: 'frontend'
        subnetAddress: '192.168.2.0/24'
      }
    ]
  }
}

module nicm 'Network/networkInterfaces.bicep' = {
  scope: rgbicep01d
  name: 'nicd'
  params: {
    location: location
    subnetId: '${vnetm.outputs.vnetId}/subnets/backend'
    nicName: nicName
  }
  dependsOn: [
    vnetm
  ]
}


module vmm 'Compute/virtualMachines.bicep' = {
  scope: rgbicep01d
  name: 'vmd'
  params: {
    location: location
    vmName: vmName
    vmPassword:vmPassword
    vmUser:vmUser
    nicId: nicm.outputs.nicId
  }
  dependsOn: [
    vnetm
    nicm
  ]
}
