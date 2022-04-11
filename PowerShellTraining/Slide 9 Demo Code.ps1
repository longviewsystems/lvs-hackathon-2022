# Strongly typed vs dynamically typed
# If you set a type for your variable, whatever you are putting into it will be treated by as the type you set it to.
# PowerShell doesn't require a variable to be typed when declared, it can be typed whenever, and the type is typically informed by the 
# content that is put into it

# Shows dynamic and strongly typing.
$MyVariable = "String"
Write-Host "$MyVariable"
$MyVariable.GetType()

[string]$MyVariable = "Another string."
Write-Host "$MyVariable"
$MyVariable.GetType()

[string]$MyVariable = 2
Write-Host "$MyVariable"
$MyVariable.GetType()

[string]$MyVariable = Get-Service
$MyVariable.GetType()
Write-Host "$MyVariable"

$MyVariable = Get-Service
$MyVariable.GetType()
Write-Host $MyVariable

$String = "Hello world"
$String.GetType()

$Integer = 2
$Integer.GetType()

# Expecting a character? Let's find out...
$Character = "A"
$Character.GetType()

# Strongly typing...
[char]$Character = "A"
$Character.GetType()


# Slide 10
# Data Structure
$MyArray = @()
$MyArray.GetType()

$AlsoAnArray = "Hi", 1, 2, "Hello"
$AlsoAnArray.GetType()

Write-Host $MyArray
Write-Host $AlsoAnArray

Write-Host $AlsoAnArray[0]
Write-Host $AlsoAnArray[-1]

$MyArray | Get-Member # We created an array of 'things' but it's empty so it is 'null' and get-member doesn't work.
$AlsoAnArray | Get-Member # Shows the constiuent objects in the array / their type.