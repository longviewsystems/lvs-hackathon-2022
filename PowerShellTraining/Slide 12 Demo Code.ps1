#Slide 12 Demo Code - Logic and Loops

# If comparative statements switch from a path that exists to a path that doesn't to demonstrate the logic.

$PathExists = Test-Path "C:\Users"

If ($PathExists -eq $True){
  Write-Host "Congratulations the path you tested is there!"
} Else {
  Write-Host "Your path doesn't exist."
}

# Simple counting loop, starting at 1, until less than or equal to 10, increment by 1 each loop.
For ($i=1; $i -le 10; $i++){
  $i,"`n"
}

# A while loop that shows a simple menu to collect input and wait until you don't press Q

while(($inp = Read-Host -Prompt "Select a command") -ne "Q"){
  switch($inp){
    L {"File will be deleted"}
    A {"File will be displayed"}
    R {"File will be write protected"}
    Q {"End"}
    default {"Invalid entry"}
  }
}


# For Each demo in an array / hash table.