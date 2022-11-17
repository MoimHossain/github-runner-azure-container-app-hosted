param storageAccountName string
param location string = resourceGroup().location  

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-05-01' existing =  {
  name: storageAccountName
}

resource storageConnection 'Microsoft.Web/connections@2016-06-01' = {
  name: 'storageConnection'
  location: location
  properties: {
    displayName: 'Storage Connection'
    api: {
      name: 'azurequeues'
      type: 'Microsoft.Web/locations/managedApis'
    }
    parameters: {
      storageAccountName: {
        value: storageAccount.name
      }
      accessKey: {
        value: listKeys(storageAccount.id, '2019-06-01').keys[0].value
      }
    }
  }
}
