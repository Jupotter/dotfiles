$env:GPG_TTY = $(tty)
$env:CHROME_BIN = "chromium"

$env:EDITOR = "vim"
$env:PATH += ":~/.bin"
$env:PATH += ":$(go env GOPATH)"
$env:PATH += ":~/.local/share/powershell/Scripts"

if ($env:TERM -eq $null) {
    return;
}

if ($env:TMUX -ne $null) {
    Invoke-Expression (&starship init powershell)

    Import-Module PSReadLine
    Set-PSReadlineOption -PredictionSource History `
        -PredictionViewStyle ListView `
        -EditMode Windows

    Set-PSReadlineKeyHandler -Key ctrl+d -Function DeleteCharOrExit

    Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

    Import-Module Posh-Git
    Import-Module PowershellHumanizer
    Import-Module Terminal-Icons

    Update-FormatData -PrependPath "${dotfilesDir}/Terminal-Icons-Humanizer.format.ps1xml"

    Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
        param($commandName, $wordToComplete, $cursorPosition)
            dotnet complete --position $cursorPosition "$wordToComplete" | ForEach-Object {
                [System.Management.Automation.CompletionResult]::Set($_, $_, 'ParameterValue', $_)
            }
    }
}

function Cd-Parent() {
    Set-Location ..
}
function Cd-Home() {
    Set-Location ~
}

function Rm-Protected {
    /usr/bin/rm -I $args
}
function Cp-Protected {
    /usr/bin/cp -i $args
}
function mv-Protected {
    /usr/bin/mv -i $args
}

function mkdir-p {
    /usr/bin/mkdir -p $args
}

function ping-limited {
    /usr/bin/ping -c 5 $args
}

Set-Alias cd.. Cd-Parent
Set-Alias cd~ 'cd-Home'
Set-Alias rm Rm-Protected
Set-Alias cp 'cp-protected'
Set-Alias mv 'mv-protected'
Set-Alias mkdir 'mkdir-p'
Set-Alias cl 'clear'
Set-Alias ping5 'ping-limited'
Set-Alias more 'less'
Set-Alias please 'sudo'
Set-Alias v 'vim'
Set-Alias q 'exit'
Set-Alias e 'vim'

function ls-color {
    /usr/bin/ls --color $args
}

function ls-list {
    ls-color -lh $args
}

function ls-all {
    ls-color -lah $args
}

Set-Alias l 'ls-color'
Set-Alias ls 'Get-ChildItem'
Set-Alias ll 'ls-list'
Set-Alias la 'ls-all'

function Display-Markdown {
    param (
        [Parameter (Mandatory= $False)]
        [string]$Document = "README.md"
    )

    pandoc $Document | lynx --stdin
}

remove-item alias:md
Set-Alias md 'Display-Markdown'

printf "\e[6 q"
