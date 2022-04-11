# Slide 29 Demo Code

# This example is courtesy of https://adamtheautomator.com/powershell-graph-api/
# The explanation is great at the above site, but this is a mini tutorial of sorts.

# Create an app in Azure and get an OAuth token, commonly with apis you need a way to authenticate
# and a token does that.

#

# Best way to authenticate / preferred is to use a certificate. For this example a self signed certificate
# was created

# Name of the tenant you are connecting to
$TenantName = <Your Tenant Name>
# Certificate output path
$CertificateOutputPath = <Your certificate path.cer>
# Certificate Store
$CertificateStore = "Cert:\CurrentUser\My"
# Expiration Date
$ExpirationDate = (Get-Date).AddYears(2)

# Certificate Splat - Splats are really nice ways to pass parameters to functions cleanly, instead of 
# what we did in functions by using -parameter name you can specify a hash table of params/values.
$CertificateSplat = @{
  FriendlyName = "AzureApp"
  DnsName = $TenantName
  CertStoreLocation = $CertificateStore
  NotAfter = $ExpirationDate
  KeyExportPolicy = "Exportable"
  KeySpec = "Signature"
  Provider = "Microsoft Enhanced RSA and AES Cryptographic Provider"
  HashAlgorithm = "SHA256"
}

# Create the Cert
$Certificate = New-SelfSignedCertificate @CertificateSplat # Note that you define a hash table with $variable = @{}, but pass the splat with @variable

# Get the cert path
$CertificatePath = Join-Path -Path $CertificateStore -ChildPath $Certificate.Thumbprint

# Export the cert
Export-Certificate -Cert $CertificatePath -FilePath $CertificateOutputPath | Out-Null