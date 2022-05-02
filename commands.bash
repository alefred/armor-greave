#demo-1
az login --use-device-code
az deployment sub create \
    --location eastus2 \
    --template-file demo-1/deploysub.bicep

az deployment group create \
    --resource-group rg-bicep-00 \
    --template-file demo-1/deploygroup.bicep


#demo-2
az bicep build --file demo-1/step1.bicep