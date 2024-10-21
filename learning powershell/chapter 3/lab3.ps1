# Run Update-Help, and ensure that it completes without errors so that you have
# a copy of the help on your local computer. You need an internet connection.
Update-Help -Verbose -Force -ErrorAction SilentlyContinue
#
# Can you find any cmdlets capable of  
# converting other cmdlets’ output into HTML?
#
Get-Help *html*
Get-Help Convertto-HTML -Examples
Get-Command -Noun Html
# Are there any cmdlets that can redirect output into a file?
Get-Command -Noun file
Get-Help Out-File
# How many cmdlets are available for working with processes?
Get-Command -Noun Process
# What cmdlet might you use to set to a PowerShell breakpoint? 
# Hint: PowerShellspecific nouns are often prefixed with PS.
Get-Command -Verb Set -Noun psbreakpoint*
# What cmdlets are available to create, modify, export, or import aliases?
Get-Command -Noun Alias
# Is there a way to keep a transcript of everything you 
# type in the shell, and save that transcript to a text file?
Help transcript
#
Get-Help Start-Transcript -Examples
# Getting all processes can be overwhelming. 
# How can you get processes by the name of the process?
Help Get-Process -Parameter name
# Is there a way to tell Get-Process 
# to tell you the user who started the process?
Get-Help Get-Process -Parameter *User*
Get-Process pwsh -IncludeUserName
# Is there a way to run a command on a remote host? 
# (Hint: Invoke is the verb for running something now.)
Get-Help *Invoke*
Get-Command Invoke-Command -Syntax
Get-Help Invoke-Command -Parameter Computername
Get-Help Invoke-Command -Parameter host*
#
# Examine the help file for the Out-File cmdlet. The files created by this cmdlet
# default to a width of how many characters? Is there a parameter that would
# enable you to change that width?
Help Out-File -Full
Get-Help Out-File -Parameter Width
#
# By default, Out-File overwrites any existing file that has the same filename as
# what you specify. 
# Is there a parameter that would prevent the cmdlet from overwriting an existing 
# file?
Help Out-File -Parameter NoClobber
# How could you see a list of all aliases defined in PowerShell?
Get-Alias
Get-Alias -Def Get-Command
# Using both an alias and abbreviated parameter names, what is the 
# shortest command line you could type to retrieve a list of commands 
# with the word process in the name?
# -no is abbreviation of Noun
gcm -no *process*
# -na is abbreviation of Name
gcm -na *process*
# How many cmdlets are available that can deal with generic objects? 
# (Hint: Remember to use a singular noun like object rather than a plural 
# one like objects.)
gcm -no *object*
# This chapter briefly mentioned arrays. What help topic could tell you more
# about them?
Help about_Arrays
help *arrays*