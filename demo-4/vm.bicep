param vmName string
param location string
param vmUser string
param nicId string
@secure()
param vmPassword string



// create windows virtual machine
resource virtualMachine 'Microsoft.Compute/virtualMachines@2021-11-01'= {
  name:vmName 
  location: location
  properties:{
    hardwareProfile: {
      vmSize: 'Standard_D1_v2' 
    }
    storageProfile: {
      // osDisk: {
      //   createOption: 'FromImage'
      // }
      imageReference: {
        publisher: 'Canonical'
        offer: 'UbuntuServer'
        sku: '18.04-LTS'
        version: 'latest'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nicId
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
      }
    }
    osProfile: {
      computerName: vmName
      adminUsername: vmUser 
      adminPassword: vmPassword
      }
    }
  }
  
