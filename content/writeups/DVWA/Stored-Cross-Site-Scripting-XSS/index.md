---
title: "Stored Cross Site Scripting (XSS) - DVWA"
description: ""
summary: "Trigger an alert pop-up with cookie values using Stored XSS."
date: 2022-08-17
draft: false
author: "Aftab Sama" # ["Me", "You"] # multiple authors
tags: ["writeups", "challenge", "DVWA", "Stored XSS"]
canonicalURL: ""
showToc: true
TocOpen: false
TocSide: 'right'  # or 'left'
weight: 11
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

we have name and message field let's put our payload in message:

payload=`<img src=x onerror="alert(document.cookie)">`

and it's working it will trigger an alert pop up with cookie value.


### **Security level: medium**

This time we put our paylod in name field we can easily bypass the maximum character limit by changing the maxlength attribute of input from DevTools.
we change the case of our payload:

payload=`<sCrIpT>alert(document.cookie);</ScRiPt>`

It will successfully trigger alert pop up with cookie value.


### **Security level: high**

this time script tag is entirely blocked so we use different payload. method same as we used in medium.

payload=`<ImG src=x onerror="alert(document.cookie)">`


Happy Hacking
