---
title: "Customize Windows command prompt like Kali Linux"
description: "Set kali-Linux like command prompt in windows terminal."
summary: "Set kali-Linux like command prompt in windows terminal."
date: 2024-07-09
draft: false
tags: ["Linux", "Kali", "Terminal"]
---


![windows terminal prompt image](images/windows-terminal-prompt.webp#center)

In PowerShell, you can use the `ESC[<n>m` sequence to set the format of the screen and text. The `<n>` number represents different formatting modes.

Reference: [Text Formatting](https://learn.microsoft.com/en-us/windows/console/console-virtual-terminal-sequences#text-formatting)

`$([char]27)` is an ASCII character representing an escape character, and the code `0` for `<n>` will reset all attributes to the default state.

Code 32 will set Foreground to Green.
```powershell
echo "$([char]27)[32m Green Colour text $([char]27)[0m"

```
![Foreground Green Colour text](images/foreground-green.webp#center)

To see all the available colours run the following powershell code:
```powershell
$Colors = '30','31','32','33','34','35','36','37','38','39','90','91','92','93','94','95','96','97'
foreach ($Color in $Colors)
{
    echo "$([char]27)[$($Color)m colour code $($Color) $([char]27)[0m"
}
```

![All Foreground Colours](images/all-foreground-colours.webp#center)

The "\`r\`n" sequence is eqivalent to `\n` newline character.
Environment variable `$env:UserName` and `$env:COMPUTERNAME` will print the username and computer name.

additionaly we can set the variable for `$([char]27)`.
```powershell
$ESC = [char]27
```
To test this, run the following command:
```powershell
echo "`r`n$ESC[32m┌──PS($ESC[94m$env:UserName@$env:COMPUTERNAME$ESC[32m)-[$ESC[0m$(Get-Location)$ESC[32m]`r`n└─$ESC[94m$ $ESC[0m"
```

![Test Custom Prompt](images/test-custom-prompt.webp#center)

Now use the prompt function in PowerShell to set the command prompt prefix.
```powershell
$ESC = [char]27
function prompt { "`r`n$ESC[32m┌──PS($ESC[94m$env:UserName@$env:COMPUTERNAME$ESC[32m)-[$ESC[0m$(Get-Location)$ESC[32m]`r`n└─$ESC[94m$ $ESC[0m" }
```

![Set Custom Prompt](images/set-custom-command-prompt.webp#center)

That’s it, Now we have a Kali Linux-like command prompt.

Additionally, you can add it to the PowerShell profile path to make it run at startup.

To get the profile path run:
```powershell
$PROFILE.AllUsersAllHosts
```

If you want to replace the Current User's Home directory with the `~` sign in the path, use the following command:
```powershell
$ESC = [char]27
function prompt { "`r`n$ESC[32m┌──PS($ESC[94m$env:UserName@$env:COMPUTERNAME$ESC$ESC[32m)-[$ESC[0m$($(Get-Location) -replace "^$([regex]::Escape($HOME+"\"))", '~\' -replace "^$([regex]::Escape($HOME))", '~')$ESC[32m]`r`n└─$ESC[94m$ $ESC[0m" }
```

![Custom Prompt with ~ sign](images/custom-prompt-with-tilde-sign.webp#center)

<br>
Happy Hacking

---
