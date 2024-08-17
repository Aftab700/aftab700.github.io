---
title: "Command Injection - DVWA"
description: ""
summary: "Perform command injection using the ping functionality."
date: 2022-08-17
draft: false
author: "Aftab Sama" # ["Me", "You"] # multiple authors
tags: ["writeups", "challenge", "DVWA", "Command Injection"]
canonicalURL: ""
showToc: true
TocOpen: false
TocSide: 'right'  # or 'left'
weight: 2
# aliases: ["/first"]
hidemeta: false
comments: true
disableHLJS: true # to disable highlightjs
disableShare: true
hideSummary: false
searchHidden: false
ShowReadingTime: true
ShowBreadCrumbs: true
ShowPostNavLinks: true
ShowWordCount: true
ShowRssButtonInSectionTermList: true
# UseHugoToc: true
# cover:
#     image: "<image path/url>" # image path/url
#     alt: "<alt text>" # alt text
#     caption: "<text>" # display caption under cover
#     relative: false # when using page bundles set this to true
#     hidden: true # only hide on current single page
# editPost:
#     URL: "https://github.com/"
#     Text: "Suggest Changes" # edit text
#     appendFilePath: true # to append file path to Edit link
---



<img width="467" alt="image" src="https://user-images.githubusercontent.com/79740895/185295923-7a149c9d-8f1e-4262-ae0a-3884514462ac.png">

we are given with functionality to ping device. we give ip or domain to ping.

input: localhost

output:

<img width="463" alt="image" src="https://user-images.githubusercontent.com/79740895/185296846-d2795040-d782-4d85-af22-5197875b0f91.png">

This is about command injection so backend must be appending our input ping command.

we can give our arbitrary command to execute with the help of pipe `|` ,so let's create a simple payload :
```
|ls
```

<img width="467" alt="image" src="https://user-images.githubusercontent.com/79740895/185297755-e48d1fc7-cccd-4a81-acf3-3558ffb70366.png">

_it works on all low, medium and high._

Happy Hacking
