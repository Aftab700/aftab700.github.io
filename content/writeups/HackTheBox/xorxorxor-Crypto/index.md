---
title: "xorxorxor - HackTheBox"
description: "https://app.hackthebox.com/challenges/xorxorxor"
summary: "Hack The Box Crypto Challenge xorxorxor"
date: 2023-04-14
draft: true
author: "Aftab Sama" # ["Me", "You"] # multiple authors
tags: ["Crypto", "HackTheBox", "Easy", "CTF", "XOR"]
canonicalURL: ""
showToc: false
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

**Challenge Description**: _Who needs AES when you have XOR?_
 
By looking at python code for encryption we know that length of key is `4` and `flag` `xor` `key` = `encrypted text` so, if we do `xor` of cipher text and first 4 character of flag that we know is `HTB{` we get the `key`.

(encrypted text) xor `"HTB{"` = `key`

now we have the key to decrypt the flag:

`cipher` xor `key` = `flag`

Python code:

```python
from pwnlib.util.fiddling import unhex, xor
eb = bytes.fromhex('134af6e1297bc4a96f6a87fe046684e8047084ee046d84c5282dd7ef292dc9')
key = xor(eb, b'HTB{')[:4]
print(xor(eb, key).decode())
```

flag: `HTB{rep34t3d_x0r_n0t_s0_s3cur3}`

Happy Hacking