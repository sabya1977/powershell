# This lab will illustrate Powershell Alias
# Date: 24-10-2024
# Author: Sabyasachi Mitra
#
# An alias in PowerShell is an alternate name for a command. A command may
# have more than one alias. Unlike languages like Bash, an alias cannot include
# parameters.
# Get all alias
Get-Alias
# Get-Alias may be used to find the command behind an alias
Get-Alias dir
# Get-Alias may also be used to find the aliases for any command
Get-Alias -Definition Get-ChildItem
# Creating new alias
New-Alias grep -Value Select-String
# Removing Alias
Remove-Alias grep
# Removing Alias using Remove-Item
Remove-Item Alias:\grep