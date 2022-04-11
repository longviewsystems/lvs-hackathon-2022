# Slide 11 Demo Code - Variables

# Can be any object/piece of data, string, int, everything in PowerShell is really an object.

$MyVariable2 # This is how you denote a variable. Syntax consists of $<name>. Best practice to make sure they mean something, $d, $y,
             # are very non descript and you should avoid it.

# Sometimes you might see $_ What does this mean? This is the current object in a pipeline
# You can write many pieces of code onto one line and pipe them through using "|". This practice can make it harder to read/understand
# what are you looking at.

$MyVariable2 = Get-Service # This runs get-service and puts the output into $MyVariable2

$myVariable2 # Case insensative. 
$MyVARiable2