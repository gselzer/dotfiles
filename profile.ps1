# -- Modules -- #

#oh-my-posh
oh-my-posh init pwsh | Invoke-Expression
# git-aliases
Import-Module git-aliases -DisableNameChecking
# posh-git
Import-Module posh-git
# zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# -- Aliases -- #
Set-Alias -Name mamba -Value C:\Users\gjselzer\AppData\Local\micromamba\micromamba.exe