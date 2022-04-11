# Slide 22 Demo Code
# Let's write a function

$ScriptPath=$MyInvocation.MyCommand.Path -Replace $MyInvocation.MyCommand.Name
$ScriptName=$MyInvocation.MyCommand.Name

Function WriteLog() {
    <#
    .SYNOPSIS 
      This function logs activities to a text file. This file is appended to with each run of the script / each logging activity.
    .DESCRIPTION
      This function logs activities to a text file. This file is appended to with each run of the script / each logging activity. Log Path, Date and Time are set to default values of Get-Date and C:\Windows\Logs but can be overwritten using the parameters specified in the function. The tempError parameter must always be passed to the function.
    .PARAMETER
      $tempTime - Set to Get-Date, can be overwritten from pipeline.
      $tempLogPath - Set to C:\Windows\Logs, can be overwritten from pipeline. - "$env:windir\Logs\BitLockerEnrollment.log"
      $tempError - This is the value that you wish to log, error / success message, etc.
    .EXAMPLE
      No Example
    .INPUTS
      $tempError
    .OUTPUTS
      No outputs/returns, but does create a text file in the $tempLogPath file.
    .NOTES
      None
    #>
    Param(
        [Parameter(Mandatory=$false,ValueFromPipeline=$True)]
        [string]
        $tempTime,
        [Parameter(Mandatory=$False,ValueFromPipeline=$True)]
        [string]
        $tempLogPath,
        [Parameter(Mandatory=$True,ValueFromPipeline=$True)]
        [string]
        $tempMessage,
        [Parameter(Mandatory=$False,ValueFromPipeline=$False)]
        [string]
        $tempLogName=$ScriptName
    )

    $tempTime = get-date -UFormat "%m/%d/%Y - %R"
    $tempLogPath = "C:\Temp\" #"$env:windir\Logs\" - Format needs trailing slash, i.e., C:\temp\ -- this is correct
    If(!(Test-path -Path "$tempLogPath")){
        New-Item -Path "$tempLogPath" -ItemType "Directory"
    }Else{

    }
    $tempTime + ' - ' + $tempMessage | Out-File -FilePath "$tempLogPath$tempLogName.log" -Append
}

WriteLog -tempMessage "Log Test"