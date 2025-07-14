---
title: "Stored Cross Site Scripting (XSS) - DVWA"
description: ""
summary: "Trigger an alert pop-up with cookie values using Stored XSS."
date: 2022-08-17
draft: falsers
tags: ["writeups", "challenge", "DVWA", "Stored XSS"]
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

---
