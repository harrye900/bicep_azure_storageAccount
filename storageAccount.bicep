@description('Storage account name')
@minLength(3)
@maxLength(24)
param storageAccountName string

@description('Location for the storage account')
param location string = resourceGroup().location

@description('Storage account SKU')
@allowed([
  'Standard_LRS'
  'Standard_GRS'
  'Standard_ZRS'
  'Premium_LRS'
])
param sku string = 'Standard_LRS'

@description('Storage account kind')
@allowed([
  'Storage'
  'StorageV2'
  'BlobStorage'
])
param kind string = 'StorageV2'

@description('Access tier for blob storage')
@allowed([
  'Hot'
  'Cool'
])
param accessTier string = 'Hot'

@description('Allow public blob access')
param allowBlobPublicAccess bool = false

@description('Minimum TLS version')
@allowed([
  'TLS1_0'
  'TLS1_1'
  'TLS1_2'
])
param minimumTlsVersion string = 'TLS1_2'

@description('Enable HTTPS traffic only')
param supportsHttpsTrafficOnly bool = true

@description('Enable hierarchical namespace for Data Lake')
param isHnsEnabled bool = false

@description('Resource tags')
param tags object = {}

@description('Enable blob versioning')
param enableVersioning bool = false

@description('Enable blob change feed')
param enableChangeFeed bool = false

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  tags: tags
  sku: {
    name: sku
  }
  kind: kind
  properties: {
    accessTier: accessTier
    allowBlobPublicAccess: allowBlobPublicAccess
    minimumTlsVersion: minimumTlsVersion
    supportsHttpsTrafficOnly: supportsHttpsTrafficOnly
    isHnsEnabled: isHnsEnabled
    blobRestoreStatus: enableVersioning ? {
      isEnabled: enableVersioning
    } : null
  }
}

output storageAccountId string = storageAccount.id
output primaryEndpoints object = storageAccount.properties.primaryEndpoints