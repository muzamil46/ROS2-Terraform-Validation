@description('Environment name')
param env string = 'dev'

@description('Application name')
param appName string = 'sample-app'

var tags = {
  env: env
  owner: 'devops'
  costCenter: '001'
  app: appName
}

resource placeholder 'Microsoft.Resources/deploymentScripts@2020-10-01' = {
  name: '${appName}-script'
  location: 'eastus'
  kind: 'AzurePowerShell'
  properties: {
    azPowerShellVersion: '5.0'
    retentionInterval: 'P1D'
    scriptContent: 'Write-Output "Hello World"'
    timeout: 'PT30M'
  }
  tags: tags
}
