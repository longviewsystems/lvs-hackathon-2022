# Slide 24 Demo Code

$ScriptPath=$MyInvocation.MyCommand.Path -Replace $MyInvocation.MyCommand.Name
$ScriptName=$MyInvocation.MyCommand.Name

# Collect some important computer related information.

$ComputerInformation = Get-CimInstance -Query "Select * From Win32_ComputerSystem"
$OSInformation = Get-CimInstance -Query "Select * From Win32_OperatingSystem"
$DiskInformation = Get-CimInstance -Query "Select * From Win32_LogicalDisk"

# Run up to here and show IntelliSense / Tab Complete...

$ComputerInformation.Name
$ComputerInformation.Manufacturer
$ComputerInformation.Model

$OSInformation.BuildNumber
$OSInformation.OSArchitecture
$OSInformation.OSType

$DiskInformation.Description
$DiskInformation.Name
$DiskInformation.Size


# Adding Hash Tables and converting to Objects

$ComputerObjectAsHash = @{}

$ComputerObjectAsHash.Add("ComputerName",$ComputerInformation.Name)
$ComputerObjectAsHash.Add("ComputerModel",$ComputerInformation.Model)
$ComputerObjectAsHash.Add("ComputerManufacturer",$ComputerInformation.Manufacturer)

$ComputerObjectAsHash

# Display...could be...ewww

$ComputerObjectAsHash | Export-Csv -Path "C:\Users\Court\Desktop\PowerShell 101 and 201\HashAsCSV.csv"

# Convert...display...less eww

[PSCustomObject]$ComputerObjectAsHash | Export-Csv -Path "C:\Users\Court\Desktop\PowerShell 101 and 201\ObjectAsCSV.csv"