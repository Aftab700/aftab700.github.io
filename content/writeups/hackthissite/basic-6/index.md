---
title: "Basic Challenge Level 6"
description: "An encryption system has been set up, which uses an unknown algorithm to change the text given. Requirements: Persistence, some general cryptography knowledge."
summary: "An encryption system has been set up, which uses an unknown algorithm to change the text given. Requirements: Persistence, some general cryptography knowledge."
date: 2024-05-08T15:30:00.000Z
draft: false
tags: ["Hack This Site", "writeup", "challenge"]
---

**Description:**

- Sam has encrypted his password. The encryption system is publicly accessible.

**Requirements:**

- General Cryptography knowledge & common sense.

**Hints:**

- Try encrypting some characters, to figure out how the encryption algorithm works. ​Start simple, like, try a small string consisting of the same character.

**Difficulty:** Easy.

**Points:** 30

**Challenge Link:** https://www.hackthissite.org/missions/basic/6

**Forum Link:**

- https://www.hackthissite.org/forums/viewforum.php?f=14&t=10752

**Solution:**

In this challenge we have encrypted password and we can encrypt our own password.

By encrypting simple string like 'aaaa' we get the encrypted version 'abcd' from this pattern we can guess that the encryption algorithm is incrementing each character by one ASCII number in ascending order. We can write simple python programme to decrypt the encrypted password.

```python
print('Decrypted password: ', end='')
a = "dgg<=g=8"
for i in range(len(a)):
    print(chr(ord(a[i])-i), end="")
```

Decrypted password: `dfe99b71`

Happy Hacking
