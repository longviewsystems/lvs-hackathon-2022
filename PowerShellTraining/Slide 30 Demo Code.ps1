# Error is a built in variable, you can access it to see all the errors in your session:
# If you have no errors in your session calling this command will generate an error as Get-Member
# expects something to be passed to it, and since $Error is $null (empty) it will cause an error.
# we will use this as a demo :P

$Error | Get-Member

# Error is an array, to access its first element, use [0]

$Error[0]

# For more details about the error specifically you can pass it to Get-Member

$Error[0] | Get-Member

# To view the command that was running or invoked that caused the error, look at the InvocationInfo
# property.

$Error[0].InvocationInfo

# the .line property of InvocationInfo shows the command that was run that caused the particular error

$Error[0].Exception # This will give you a 'plain description' of the error.

# Remember, you can get information on anything in PowerShell with Get-Help and Get-Member.
# Using Get-Member to get the TypeName is super important as you can catch specific errors

$Error[0].Exception | Get-Member # Show the TypeName System.InvalidOperationException

# Two types of errors exist, terminating (ones that stop the execution of the command/program)
# and non terminating that are handled by the commandlet/command you are running.
# non-terminating errors can not be handled by Try/Catch/Finally...except they can, you'll see.

# Terminating
Get-SomeCommandletThatDoesntExist

# Non Terminating

Get-ChildItem -Path "C:\Windows\appcompat" -Recurse

# Remember how I said stay tuned? Here's how you force a non terminating error to terminate
# $ErrorActionPreference

<#
Stop

Display error, and stop execution.

Inquire

Display error, and ask to continue.

Continue (Default)

This is the default setting. Display error, then continue execution.

Suspend

This one is for workflows. A workflow job is suspended to investigate what happened, then the workflow can be resumed.

SilentlyContinue

No error is displayed, execution is continued.
#>

# Demo non terminating again:
Get-ChildItem -Path "C:\Windows\appcompat" -Recurse
Write-Host "Test"

# Set $erroractionpreference to stop

$ErrorActionPreference = "Stop"

Get-ChildItem -Path "C:\Windows\appcompat" -Recurse
Write-Host "Test"

# Some commands come with ErrorAction Parameter, you can use that too
# Show Get-ChildItem having the param.

# You can use an if statement to validate, but it's not really handing the error:
# Show Windows and Windowz
If (Test-Path -Path "C:\Windows\"){
  Write-Host "Windows exists!"
} Else {
  Write-Host "You're fibbing."
}

# Non specific

Try{
  Get-ThisFakeCommand
}
Catch{
  Write-Host "Your command threw an error the exception is: $($_.Exception.Message)"
}
Finally{
  # Finally is not required, but you could use it to clean up connections to databases, running scripts.
  # etc.
  Write-Host "Clean up"
}

# Convert to multiple catch statements (yes you can have multiple)
# catch the specific error

Try{
  # Uncomment this after you go through once.
  # Get-ChildItem -Path "Q:\" -ErrorAction Stop
  Get-ThisFakeCommand
}
Catch [System.Management.Automation.CommandNotFoundException] {
  Write-Host "Your command was not found"  -ForegroundColor "Green"
  Write-Host "Your command threw an error the exception is: $($_.Exception.Message)" -ForegroundColor "Green"
}
<#Uncomment this after first pass.
Catch{
  Write-Host "Generic Error message: $($_.Exception.Message)" -ForegroundColor "Blue"
}#>
Finally{
  # Finally is not required, but you could use it to clean up connections to databases, running scripts.
  # etc.
  Write-Host "Clean up"
}


# Check out Ginger Ninja for a function and more detailed explanation: https://www.gngrninja.com/script-ninja/2016/6/5/powershell-getting-started-part-11-error-handling