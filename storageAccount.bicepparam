using 'storageAccount.bicep'

param storageAccountName = 'mystorageacct001'
param location = 'East US'
param sku = 'Standard_GRS'
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
param enableVersioning = true
param enableChangeFeed = false