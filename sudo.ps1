Install-Module -Name NtObjectManager
Start-Service -Name TrustedInstaller
$parent = Get-NtProcess -ServiceName TrustedInstaller
$proc = New-Win32Process cmd.exe -CreationFlags NewConsole -ParentProcess $parent