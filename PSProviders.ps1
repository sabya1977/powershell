# This lab will illustrate Powershell Providers
# Date: 02-16-2025
# Author: Sabyasachi Mitra
#
# A PowerShell Provider is a .NET-based component that allows PowerShell 
# to interact with different data stores in a consistent way. Provider 
# lets you access and manage different kinds of data such as local disk, 
# file system, registry, environment variables, and even Active Directory, 
# using standard cmdlets like Get-Item, Set-Item, Get-ChildItem, and Remove-Item.
#
# get list of providers
Get-PSProvider
#
# trimmed output
# Name                 Capabilities                                        Drives
# ----                 ------------                                        ------
# Registry             ShouldProcess                                       {HKLM, HKCU}
# Environment          ShouldProcess                                       {Env}
# FileSystem           Filter, ShouldProcess, Credentials                  {C, Temp}
#
# PSDrive :: A data storage location that PowerShell can access like a file system.
# 
# So Provider provides mechanism to access various data storage and structures and
# PSDrive are those data storage and structures which Adapters let you access and manage.
Get-PSDrive
#
# Name           Used (GB)     Free (GB) Provider      Root    CurrentLocation
# ----           ---------     --------- --------      ----    ---------------
# C                 288.76        187.31 FileSystem    C:\     Users\sabya
# HKCU                                   Registry      HKEY_CURRENT_USER
# HKLM                                   Registry      HKEY_LOCAL_MACHINE
# Temp              288.76        187.31 FileSystem    C:\Users\sabya\AppData\Local\Temp\
#
# Navigating file system
# Set-Location is analogous to cd command
Set-Location C:\Users\sabya
# You can create a folder
New-Item testdir -ItemType Directory
# create a file
New-Item testdir/test-file.txt -ItemType File
# add content to file
Add-Content testdir/test-file.txt "Test Powershell file system navigation"
# get content
Get-Content testdir/test-file.txt
# delete the file
Remove-Item testdir/test-file.txt -Confirm
# delete directory
Remove-Item testdir
#
# to get all PSDrive related cmdlets
Get-Command -Noun *item*
# get child items in a container (directory).
# the following commands displays all folders and files inside gitrepos directory
Get-ChildItem .\gitrepos
# get child items recurisively in a container (direcory)
Get-ChildItem .\gitrepos -Recurse
# if the above command's output is too big you can limit the depth
Get-ChildItem .\gitrepos -Recurse -Depth 1
# following command is analogus to ls 
Get-Item .\gitrepos
#
# include only those which starts with p. If * in the path is not included -Include returns no result.
# Include works recursively. Exclude operator exlcudes the pattern
# 
Get-ChildItem .\gitrepos\* -Include o*
#
# Filter  parameter works like a ls with wildcard character and does not work recurisively with -Recurse
Get-ChildItem .\gitrepos -Filter o*
#
# Testing Set-IetmProperty cmdlet
Set-Location C:\Users\sabya
# You can create a folder
New-Item testdir -ItemType Directory
# create a file
New-Item testdir/test-file.txt -ItemType File
# add content to file
Add-Content testdir/test-file.txt "Test Powershell file system navigation"
# set item property to readonly
Set-ItemProperty testdir/test-file.txt -Name IsReadOnly $true
# get item property
Get-ItemProperty testdir/test-file.txt 
#
Set-ItemProperty testdir/test-file.txt -Name IsReadOnly $true
# you can't add contents to the file any longer
# the following command will give error
Add-Content testdir/test-file.txt "Test Powershell file system navigation"
# to unset read only
Set-ItemProperty testdir/test-file.txt -Name IsReadOnly $false
#
# Path Vs. Literal Path
Set-Location C:\Users\sabya
New-Item test[01] -ItemType Directory
New-Item -Path C:\users\sabya\test[01]\file.txt -ItemType File
# returns no result
Get-ChildItem -Path C:\users\sabya\test[01]
# Path is replaced with LiteralPath so wildcard characters [] are treated like usual charactors
Get-ChildItem -LiteralPath C:\users\sabya\test[01]
#
# Other providers
# Envirornment variable
# gives all env. variables and their value
Get-Item env:*
# create a new env. variable
New-Item env:TEST -Value 100
Get-ChildItem Env:TEST
Set-Item env:TEST -Value 1000
#
# Windows Registry
# go to HKEY_CURRENT_USER
Set-Location -Path HKCU:
# go to HKEY_CURRENT_USER/software
Set-Location -Path software
# list all keys under software
Get-ChildItem
Get-ChildItem Microsoft
Set-Location ./Windows
# Lets set EnableAeroPeek registry value to 0 from 1
Set-ItemProperty -Path DWM -PSProperty EnableAeroPeek -Value 0
# To go back to local storage PSDrive
Set-Location C:\Users\Sabya