# Slide 26 Demo Code Part 1

# Strings are objects

"Hello World" | Get-Member

# Combining two strings

$String1 = "Hello"
$String2 = "World!"

$String1 + " " + $String2

# Or

"$String1 $String2"

# Array of Strings

$StringArray = @("This is", "An array of strings")
"$StringArray"

#Splitting Strings

$String3 = "Hello World"
$String3
$String3.Split(" ")

# Substrings, unlike splitting you have to specify a 
# starting point and a length so you have to know what the string contains
# counting starts at 0 like an array index.

$String4 = "Hello World"
$String4.Substring(6,5)

# Light searching, prepare for the darkside....

$String5 = "Hello again!"
$String5.Contains("!")
$String5.IndexOf("!")
