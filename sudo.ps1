$module = Get-InstalledModule -Name 'NtObjectManager' -ErrorAction SilentlyContinue
$username = (Get-WmiObject -Class Win32_ComputerSystem).Username | Split-Path -Leaf

if (-not $module) {
    Install-Module -Name 'NtObjectManager' -Force
}

if ($args.Count -eq 0 -or $args[0] -eq '/?') {
    Write-Host "Usage: sudo [/s] [command]`nExample: sudo services.msc`nCommand Prompt: sudo /s`nExecutes the specified command with elevated privileges."
    return
}

if ($args[0] -eq '/s') {
    $command = "cmd.exe /c cls && cd C:\Users\$username && cmd.exe /K"
}
else {
    $command = "cmd.exe /c $($args -join ' ') && pause"
}

Start-Service -Name TrustedInstaller
$parent = Get-NtProcess -ServiceName TrustedInstaller
$proc = New-Win32Process $command -CreationFlags NewConsole -ParentProcess $parent
