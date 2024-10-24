# This lab will illustrate Powershell Command naming convention
# Date: 24-10-2024
# Author: Sabyasachi Mitra
#
# Commands in PowerShell are formed around 
# verb and noun pairs in the form verb-noun.
#
# Verbs and Nouns :: Powshell commands generally starts with a verb and 
# followed by a noun. The verb-noun pairing strives to make it easier to
# find commands without resorting to search engines.
#
# Verbs are words such as Add, Get, Set, and New, etc.
# The list of verbs can be seen in PowerShell using the following command:
Get-Verb
# Nouns provides a very short description of 
# the object the command is expecting to act on.  
#
# Get all the commands related to getting Windows firewall settings
Get-Command Get-*Firewall*
# Get all commands with Verb Get and Set related to Firewall
Get-Command -Verb Get, Set -Noun *Firewall*
