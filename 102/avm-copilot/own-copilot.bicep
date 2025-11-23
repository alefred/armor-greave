module buildYourOwnCopilot 'br/public:avm/ptn/sa/build-your-own-copilot:0.1.0' = {
  name: 'buildYourOwnCopilotDeployment'
  params: {
    // Required parameters
    azureAiServiceLocation: 'eastus2'
    enableMonitoring: false
    enablePrivateNetworking: false
    enablePurgeProtection: false
    enableRedundancy: false
    enableScalability: false
    // Non-required parameters
    enableTelemetry: true
    vmSize: 'Standard_DS_v4'
  }
}
