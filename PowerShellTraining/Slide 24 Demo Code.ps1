# Slide 24 Demo Code

$ScriptPath=$MyInvocation.MyCommand.Path -Replace $MyInvocation.MyCommand.Name
$ScriptName=$MyInvocation.MyCommand.Name

# Collect some important computer related information.

$ComputerInformation = Get-CimInstance -Query "Select * From Win32_ComputerSystem"
$OSInformation = Get-CimInstance -Query "Select * From Win32_OperatingSystem"
$DiskInformation = Get-CimInstance -Query "Select * From Win32_LogicalDisk"

# See what we have collected...
# Get-Help and the scripting guy...https://devblogs.microsoft.com/scripting/sort-output-before-sending-to-powershell-out-gridview/

$ComputerInformation | Out-GridView
$OSInformation | Out-GridView
$DiskInformation | Out-GridView

# Run up to here and show IntelliSense / Tab Complete...
<#
$ComputerInformation.Name
$ComputerInformation.Manufacturer
$ComputerInformation.Model

$OSInformation.BuildNumber
$OSInformation.OSArchitecture
$OSInformation.OSType

$DiskInformation.Description
$DiskInformation.Name
$DiskInformation.Size
#>

# Build the object

$ComputerObject = [PSCustomObject]@{
  HostName = "$($ComputerInformation.Name)"
  MakeAndModel = "$($ComputerInformation.Manufacturer) -- $($ComputerInformation.Model)"
  OperatingSystemInformation = "$($OSInformation.BuildNumber) -- $($OSInformation.OSArchitecture) -- $($OSInformation.OStype)"
}

# Show it off

$ComputerObject | Out-GridView