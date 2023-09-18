$module = Get-InstalledModule -Name 'NtObjectManager' -ErrorAction SilentlyContinue
$username = (Get-WmiObject -Class Win32_ComputerSystem).Username | Split-Path -Leaf

if (-not $module) {
    Install-Module -Name 'NtObjectManager' -Force
}

$command = $args -join ' '
Start-Service -Name TrustedInstaller
$parent = Get-NtProcess -ServiceName TrustedInstaller
$proc = New-Win32Process "cmd.exe /c cls && cd C:\Users\$username && cmd.exe /K" -CreationFlags NewConsole -ParentProcess $parent
