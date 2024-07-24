param webAppName string
param location string = 'Canada East'

resource appServicePlan 'Microsoft.Web/serverfarms@2021-02-01' = {
  name: '${webAppName}-plan'
  location: location
  sku: {
    name: 'S1'
    tier: 'Standard'
  }
  properties: {
    reserved: true
  }
}

resource webApp 'Microsoft.Web/sites@2021-02-01' = {
  name: webAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
  }
}

output webAppEndpoint string = webApp.properties.defaultHostName
