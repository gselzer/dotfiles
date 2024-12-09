# -- Micromamba -- #

#region mamba initialize
# !! Contents within this block are managed by 'mamba shell init' !!
$Env:MAMBA_ROOT_PREFIX = "C:\Users\gjselzer\micromamba"
$Env:MAMBA_EXE = "C:\Users\gjselzer\AppData\Local\micromamba\micromamba.exe"
(& $Env:MAMBA_EXE 'shell' 'hook' -s 'powershell' -p $Env:MAMBA_ROOT_PREFIX) | Out-String | Invoke-Expression
#endregion

Set-Alias -Name mamba -Value micromamba

mamba config --set changeps1 False

# -- oh-my-posh -- #

oh-my-posh init pwsh --config "C:\Users\gjselzer\code\gselzer\dotfiles\themes\mytheme.omp.json" | Invoke-Expression

# -- posh-git -- #

Import-Module posh-git

# -- git-aliases -- #

Import-Module git-aliases -DisableNameChecking

# -- zoxide -- # 

Invoke-Expression (& { (zoxide init powershell | Out-String) })
