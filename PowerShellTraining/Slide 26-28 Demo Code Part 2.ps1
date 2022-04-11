param(
    [Parameter(
        Mandatory=$False,
        HelpMessage="Please enter the Filepath for a list of IPs to test against",
        Position=1
    )][string]$IPFilepath
)

function InitialPattern($ListOfIPs)
{
    #INITIAL - Matches on the pattern of an IP
    $IPPattern = '(?:[0-9]{1,3}\.){3}[0-9]{1,3}'
    $IPRange = $ListOfIPs | Select-String -Pattern $IPPattern -AllMatches
    return $IPRange
}

function ValidPattern($ListOfIPs)
{
    #INTERMEDIATE - Validates an Actually valid IP, but false positives are there (1.1.1.01 is accepted by this).
    $IPPattern = '^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$'
    $IPRange = $ListOfIPs | Select-String -Pattern $IPPattern -AllMatches
    return $IPRange
}

function FinalPattern($ListOfIPs)
{
    #FINAL - Validates an Actually valid IP
    $IPPattern = '^(?:(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])$'
    $IPRange = $ListOfIPs | Select-String -Pattern $IPPattern -AllMatches
    return $IPRange
}

#SAMPLE IP LIST - Several are not valid IPs, and should be caught by the regex.
if (-Not $IPFilepath)
{
    $IPList = @()
    $IPList += "192.168.10.10" #Valid
    $IPList += "172.16.100.1" #Valid
    $IPList += "255.255.255.255" #Valid
    $IPList += "329.16.122.986" #NOT VALID
    $IPList += "10.20.30.01" #NOT VALID
    $IPList += "74.87.194.0" #Valid
    $IPList += "64.92.0.211" #Valid
    $IPList += "87.58.300.211" #NOT VALID
}
else {
    $IPList = Get-Content $IPFilepath
}

Write-Host "Intial Parttern"
InitialPattern $IPList
Write-Host "`n Valid Pattern"
ValidPattern $IPList
Write-Host "`n Final Pattern"
FinalPattern $IPList