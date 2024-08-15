---
title: "Weak Session IDs - DVWA"
description: ""
summary: "Identify the cookie session ID pattern."
date: 2022-08-17
draft: false
author: "Aftab Sama" # ["Me", "You"] # multiple authors
tags: ["writeups", "challenge", "DVWA", "Weak Session ID"]
canonicalURL: ""
showToc: true
TocOpen: false
TocSide: 'right'  # or 'left'
weight: 8
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


### **Security level: low**

cookie value is easily predictable it's initially 0 and increment by 1 on regenerate.

### **Security level: medium**

cookie value is set using time(); method.

### **Security level: high**

It's is similar to low level but it is doing md5 hash of that additionally.


Happy Hacking
