# This lab will illustrate Powershell Commands and Parameters
# Date: 25-10-2024
# Author: Sabyasachi Mitra
#
# 1. Powershell command can be a cmdlet, function, external application.
# 2. Cmdlet is a native PowerShell command-line utility written in .NET
# language such as C#.
# 3. Microsoft cmdlets names have two parts: verb and noun.
# verbs are Get, Set, Add and New.
# Nouns describe the object the verb acts on.
# Example:
Get-Process
# Get all the commands related to getting Windows firewall settings
Get-Command Get-*Firewall*
# Get all commands with Verb Get and Set related to Firewall
Get-Command -Verb Get, Set -Noun *Firewall*
#
# Command Parameters:
#
# Powershell supports four kinds of parameters. They can be identified in
# Get-Help command description.
#
# Optional parameters :: parameters and its value are surrounded by []. 
# If parameter is supplied value must supplied too.
# Syntax:
# Get-Help [-Category <string[]>]
Get-Help -Category HelpFile
#
# Optional positional parameters :: In addition to parameter and its value, 
# paarmeter name is also surrounded by []. So parameter name can be ommitted
# but value must be given.
#
# SYNTAX:
# Get-Process [[-Name] <string[]>]
# following two commands are same:
Get-Process -Name pwsh 
Get-Process pwsh
#
# Mandatory parameters :: parameter name and its value must be supplied:
#
# SYNTAX
# Get-ADUser -Filter <string>
Get-ADUser -Filter 'sAMAccountName -eq "Sabya"'
#
# Mandatory positional parameters :: parameter and its value must be supplied but in some cases
# parameter name can be ommitted. 
#
# SYNTAX
# Get-ADUser [-Identity] <ADUser>
# All of the below commands are same:
Add-Content -Path C:\Users\sabya\file.txt -Value "Testing Mandatory Positional parameters"
Add-Content -Value "Testing Mandatory Positional parameters" -Path C:\Users\sabya\file.txt
Add-Content "Testing Mandatory Positional parameters" -Path C:\Users\sabya\file.txt
Add-Content "Testing Mandatory Positional parameters" C:\Users\sabya\file.txt
Add-Content C:\Users\sabya\file.txt -Value "Testing Mandatory Positional parameters"
Add-Content C:\Users\sabya\file.txt "Testing Mandatory Positional parameters"
#
Get-Content C:\Users\sabya\file.txt
#
# Switch Parameter: Doesn't require any arguement. If it's present the value is True if it's not False.
# Switch parameter is used to toggle the bahvior of a command:
# Recuse (switch parameter) will show the contents of the folder C:\app
# Depth will limit it to 1 level
Get-ChildItem -Path C:\app -Recurse -Depth 1
#
# More than one parameter values: Some parameter takes more than one values
# Parameters that accept more than one value use [] after the type name whic indicates an arrat of strigs
# Syntax: 
# Get-Service [[-Name] <String[]>]
Get-Service -Name WinDefend, WlanSvc
#
# Parameter sets :: a parameter set is a set of parameters that may be used together when running a command
# For exmaple, Stop-Process command has three sets of parameter:
# SYNTAX:
# Stop-Process [-Id] <Int32[]> [-Confirm] [-Force] [-PassThru] [-WhatIf] [<CommonParameters>]
# Stop-Process [-InputObject] <Process[]> [-Confirm] [-Force] [-PassThru] [-WhatIf] [<CommonParameters>]
# Stop-Process [-Confirm] [-Force] -Name <String[]> [-PassThru] [-WhatIf] [<CommonParameters>]
# Example:
# start a process
$process = Start-Process notepad
# shows the PID of the process. $PID shows the PID of the powershell console PID
$vPID = Get-Process "notepad"
Stop-Process $vPID
##
# Confirm and ConfirmPreference : Confirm is a switch parameter. If specified, the command will prompt.
# Example:
Set-location C:\Users\sabya
New-Item new-file.txt -Force -Confirm
Remove-Item new-file.txt -Confirm
# does not prompt
Remove-Item new-file.txt -Confirm:$false
#
# WhatIf :: used when testing a command. It allows a state-changing command to run without making the change
#
Set-location C:\Users\sabya
New-Item new-file.txt -Force -Confirm
Remove-Item new-file.txt -WhatIf
# it displays the following message
# What if: Performing the operation "Remove File" on target "C:\Users\sabya\new-file.txt".
#
# PassThru :: used with commands that do not generate output and force the command to return the object
Start-Process notepad -PassThru
Stop-Process -Name Notepad