<#
.SYNOPSIS
    Hide Drives in Windows 10
	Mark Messink 27-05-2021
	Working on Windows Build 10.0.21354.0 and older

.DESCRIPTION
 
.INPUTS
  None

.OUTPUTS
  Log file: pslog_HideDrives.txt
  
.NOTES
Drives		ValueData
ShowAll		0
A			1
B			2
C			4
D			8
E			16
F			32
G			64
H			128
I			256
J			512
K			1024
L			2048
M			4096
N			8192
O			16384
P			32768
Q			65536
R			131072
S			262144
T			524288
U			1048576
V			2097152
W			4194304
X			8388608
Y			16777216
Z			33554432
Hide All	67108863

If you want to hide multiple drives then add the decimal numbers (such as, for Drive D and E use 24).

.EXAMPLE
  .\HideDrives.ps1 

#>

# Aanmaken standaard logpath (als deze nog niet bestaat)
$path = "C:\IntuneLogs"
If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
}

$logPath = "$path\pslog_HideDrives.txt"

#Start logging
Start-Transcript $logPath -Append -Force

	Write-Output "-------------------------------------------------------------------"
    Write-Output "Hide Drives"
	#4 = Drive C:
	New-ItemProperty -Path "HKLM:SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoDrives" -Value "4" -PropertyType DWORD -Force	
    
    Write-Output "-------------------------------------------------------------------"

#Stop Logging
Stop-Transcript
