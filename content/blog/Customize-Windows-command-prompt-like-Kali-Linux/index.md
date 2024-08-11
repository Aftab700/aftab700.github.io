---
title: "Customize Windows command prompt like Kali Linux"
description: "Set kali-Linux like command prompt in windows terminal."
summary: "Set kali-Linux like command prompt in windows terminal."
date: 2024-07-09
draft: false
author: "Aftab Sama" # ["Me", "You"] # multiple authors
tags: ["Linux", "Kali", "Terminal"]
canonicalURL: ""
showToc: true
TocOpen: false
TocSide: 'right'  # or 'left'
# weight: 1
# aliases: ["/first"]
hidemeta: false
comments: false
disableHLJS: true # to disable highlightjs
disableShare: true
hideSummary: false
searchHidden: false
ShowReadingTime: true
ShowBreadCrumbs: true
ShowPostNavLinks: true
ShowWordCount: true
ShowRssButtonInSectionTermList: true
UseHugoToc: true
cover:
    image: "<image path/url>" # image path/url
    alt: "<alt text>" # alt text
    caption: "<text>" # display caption under cover
    relative: false # when using page bundles set this to true
    hidden: true # only hide on current single page
# editPost:
#     URL: "https://github.com/"
#     Text: "Suggest Changes" # edit text
#     appendFilePath: true # to append file path to Edit link
---


![windows terminal prompt image](images/windows-terminal-prompt.png#center)

In PowerShell, you can use the `ESC[<n>m` sequence to set the format of the screen and text. The `<n>` number represents different formatting modes.

Reference: [Text Formatting](https://learn.microsoft.com/en-us/windows/console/console-virtual-terminal-sequences#text-formatting)

`$([char]27)` is an ASCII character representing an escape character, and the code `0` for `<n>` will reset all attributes to the default state.

Code 32 will set Foreground to Green.
```powershell
echo "$([char]27)[32m Green Colour text $([char]27)[0m"

```
![Foreground Green Colour text](images/Foreground-Green.png#center)

To see all the available colours run the following powershell code:
```powershell
$Colors = '30','31','32','33','34','35','36','37','38','39','90','91','92','93','94','95','96','97'
foreach ($Color in $Colors)
{
    echo "$([char]27)[$($Color)m colour code $($Color) $([char]27)[0m"
}
```

![All Foreground Colours](images/all-foreground-colours.png#center)

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

![Test Custom Prompt](images/test-custom-prompt.png#center)

Now use the prompt function in PowerShell to set the command prompt prefix.
```powershell
$ESC = [char]27
function prompt { "`r`n$ESC[32m┌──PS($ESC[94m$env:UserName@$env:COMPUTERNAME$ESC[32m)-[$ESC[0m$(Get-Location)$ESC[32m]`r`n└─$ESC[94m$ $ESC[0m" }
```

![Set Custom Prompt](images/set-custom-command-prompt.png#center)

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

![Custom Prompt with ~ sign](images/Custom-Prompt-with-tilde-sign.png#center)

<br>
Happy Hacking