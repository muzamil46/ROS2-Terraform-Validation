param env string = 'dev'
param appName string = 'sample-app'

var tags = {
  env: env
  owner: 'devops'
  cost-center: '001'
  app: appName
}

resource dummy 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: '${appName}-rg'
  location: 'eastus'
  tags: tags
}
