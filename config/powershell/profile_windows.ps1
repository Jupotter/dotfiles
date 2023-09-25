if (!($Host.Name -match "ConsoleHost")) {
    return;
}


Invoke-Expression (&C:\msys64\usr\bin\starship init powershell)

Import-Module PSReadLine
Set-PSReadlineOption -PredictionSource History `
-PredictionViewStyle ListView `
-EditMode Windows

Set-PSReadlineKeyHandler -Key ctrl+d -Function DeleteCharOrExit

Import-Module Posh-Git
# Import-Module PowershellHumanizer
Import-Module Terminal-Icons

# Update-FormatData -PrependPath '~/.config/powershell/Terminal-Icons-Humanizer.format.ps1xml'

# Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
#     param($commandName, $wordToComplete, $cursorPosition)
#         dotnet complete --position $cursorPosition "$wordToComplete" | ForEach-Object {
#             [System.Management.Automation.CompletionResult]::Set($_, $_, 'ParameterValue', $_)
#         }
# }

# Invoke-Expression -Command /snap/task/current/completion/ps/task.ps1
