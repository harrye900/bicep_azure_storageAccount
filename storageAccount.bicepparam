using 'storageAccount.bicep'

param storageAccountName = 'racetrac000303335'
param location = 'East US'
param sku = 'Standard_LRS'
param kind = 'StorageV2'
param accessTier = 'Hot'
param allowBlobPublicAccess = false
param minimumTlsVersion = 'TLS1_2'
param supportsHttpsTrafficOnly = true
param isHnsEnabled = false
param tags = {
  Environment: 'Development'
  Project: 'MyProject'
  Owner: 'TeamName'
}
