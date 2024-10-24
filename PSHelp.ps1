# This lab will illustrate Powershell Help mechanism.
# Date: 23-10-2024
# Author: Sabyasachi Mitra
#
# Updatable Help :: Updatable Help allows users to obtain the most recent 
# versions of their help documentation outside of PowerShell on a web service. 
# Help content can be downloaded and installed using the Update-Help command 
# in PowerShell.
# Examples:
# Describes the updatable help system in PowerShell.
Get-Help about_Updatable_Help
# The following will update Powershell help files from Internet (MS site)
Update-Help -Verbose -Force -ErrorAction SilentlyContinue
# Show examples of Get-Process
Get-Help Get-Process -Examples
# get help on parameters
Get-Help Import-Csv -Parameter Path
# Detailed help
Get-Help Get-Process -Detailed
# Windows display of Help
Get-Help Get-Command -ShowWindow
#
# Get UI Culture :: Language setting in which Help is displayed and saved.
Get-UICulture
#
# If computer does not have Internet connection Update-Help cannot be used
# instead, Save-Help can be used to save Help on disk locally and used 
# without Internet connection.
New-Item -Path C:\Users\sabya\gitrepos\powershell\PSHelp -ItemType Directory
Save-Help -Module Microsoft.PowerShell.Management -DestinationPath C:\Users\sabya\gitrepos\powershell\PSHelp
#
# Help content that was saved using Save-Help can be imported 
# from a folder using the SourcePath parameter:
Update-Help -Verbose -Force -ErrorAction SilentlyContinue -SourcePath C:\Users\sabya\gitrepos\powershell\PSHelp
# If UI Culture is not set to en-US 
Update-Help -Module Microsoft.PowerShell.Management -SourcePath C:\Users\sabya\gitrepos\powershell\PSHelp -UICulture en-US
#
# About_* files :: About_* documents describe features of the language or concepts
# that apply to more than one command in Powershell. 
# These items do not fit into help for individual commands.
#
# The list of help files can be viewed by running
# Get-Help with the category set to HelpFile
Get-Help -Category HelpFile
# Alternatively
Get-Help -Name About_*