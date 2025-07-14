---
title: "Basic Challenge Level 9"
description: "The password is again hidden in an unknown file. However, the script that was previously used to find it has some limitations. Requirements: Knowledge of SSI, unix directory structure."
summary: "The password is again hidden in an unknown file. However, the script that was previously used to find it has some limitations. Requirements: Knowledge of SSI, unix directory structure."
date: 2024-09-09
draft: false
tags: ["Hack This Site", "writeup", "challenge"]
---

**Description:**

Sam is going down with the ship.
He's determined to keep obscuring the password file, no matter how many times people manage to recover it.
This time the file is saved in `/var/www/hackthissite.org/html/missions/basic/9/`.

In Basic 8, in his attempt to limit SSI to that challenge only, he mistakenly screwed up somewhere.
There is a way to get the obscured Basic 9 password, see if you can figure out how...

**Requirements:**

- SSI knowledge & UNIX directory structure understanding.

**Hints:**

- Read the description carefully.
- Look up "directory traversal".

**Difficulty:** Easy.

**Points:** 45

**Challenge Link:** https://www.hackthissite.org/missions/basic/9

**Forum Link:**

- https://www.hackthissite.org/forums/viewforum.php?f=14&t=10755

**Solution:**

Come back to [level 8](../basic-8/) and use the same payload to list files from the level 9 directory using `../../9`.

```
<!--#exec cmd="ls ../../9" -->
```

We get the file named `p91e283zc3.php`, which contains the password `1f6aa876`.

Happy Hacking

---
