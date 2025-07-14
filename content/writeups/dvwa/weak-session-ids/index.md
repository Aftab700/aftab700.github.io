---
title: "Weak Session IDs - DVWA"
description: ""
summary: "Identify the cookie session ID pattern."
date: 2022-08-17
draft: false
tags: ["writeups", "challenge", "DVWA", "Weak Session ID"]
---


### **Security level: low**

cookie value is easily predictable it's initially 0 and increment by 1 on regenerate.

### **Security level: medium**

cookie value is set using time(); method.

### **Security level: high**

It's is similar to low level but it is doing md5 hash of that additionally.


Happy Hacking

---
