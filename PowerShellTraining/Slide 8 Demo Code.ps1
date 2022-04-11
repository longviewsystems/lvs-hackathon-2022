# Show Get-Help

# Show Get-Member
$Services = Get-Service
$Services | Get-Member

# Show .GetType()
$Services.GetType()

$AString = "A string"
$AString.GetType()

# A single line comment

<#
  Multiline comment
  See?
#>

# The Quote Vs Battle "" vs ''
$ExampleString = "Hello"
$ExampleString2 = 'Hi'

Write-Host "$ExampleString" # Used to expand variables and other things. I prefer these and using '' is for use cases.
Write-Host "$ExampleString2"
Write-Host '$ExampleString' # The literal interpretation 
Write-Host '$ExampleString2'