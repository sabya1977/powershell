# Powershell Tutorial - Fundamentals
#
# Get-Command is a cmdlet which has a verb-noun naming 
# convention, that is, Get is verb and Command is noun. 
Get-Command 
# get a command whose exact name you don't know: 
# following command will get all the powershell commands with Service as Noun
Get-Command -Noun Service
Get-Command -Verb Set -Noun Service
#
# Get-Help to detail description of a command
Get-Help Get-Service -Full
#
# get alias of a command or all commands
# An alias is nothing more than a nickname for a command
Get-Alias -Definition "Get-Process"
# get current date of the year 2024
Get-Date -Year 2024
