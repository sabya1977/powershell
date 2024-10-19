# Get-Command is a cmdlet which has a verb-noun naming 
# convention, that is, Get is verb and Command is noun. 
Get-Command 
# get a command whose name you don't know: 
# following command will get all the powershell commands with Service as Noun
Get-Command -Noun Service
Get-Command -Verb Set -Noun Service
# get current date of the year 2024
Get-Date -Year 2024
