$dotfilesDir = Get-Item $Profile.CurrentUserAllHosts | Select-Object -ExpandProperty Target | Split-Path -parent

if ([System.Environment]::OSVersion.Platform -eq "Unix") {
    ."${dotfilesDir}/profile_linux.ps1"
} else {
    ."${dotfilesDir}/profile_windows.ps1"

}
