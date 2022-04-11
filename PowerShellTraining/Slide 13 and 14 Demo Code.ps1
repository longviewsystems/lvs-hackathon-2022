#Slide 13 and 14 Demo Code - Array and Hash Table, and ForEach loop demo

$MySuperAmazingArray = 1,2,3,4

ForEach ($Number in $MySuperAmazingArray){
  Write-Host "This is your number: $Number"
}

# Hash table
$MySuperAmazingHashTable = @{}
$MySuperAmazingHashTable.Add("First Name", "Courtney")
$MySuperAmazingHashTable

# Do you think this is going to work? Why / why not?
$MySuperAmazingHashTable.Add("First Name", "David")
$MySuperAmazingHashTable

$MySuperAmazingHashTable.Add("Last Name", "Marr")
$MySuperAmazingHashTable.Add("Occupation", "Solution Architect")

# "What's inside??"
$MySuperAmazingHashTable | Get-Member

# Display all the keys, or all the values
$MySuperAmazingHashTable.Keys
$MySuperAmazingHashTable.Values

$MySuperAmazingHashTable.'First Name'

ForEach ($key in $($MySuperAmazingHashTable.keys)){
  $key
}

# Bonus ForEach Loop

$Services = Get-Service
ForEach ($Service in $Services){
  $Service.Name
  $Service.StartType
}