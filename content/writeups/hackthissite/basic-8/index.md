---
title: "Basic Challenge Level 8"
description: "The password is yet again hidden in an unknown file. Sam's daughter has begun learning PHP, and has a small script to demonstrate her knowledge. Requirements: Knowledge of SSI (dynamic html executed by the server, rather than the browser)"
summary: "The password is yet again hidden in an unknown file. Sam's daughter has begun learning PHP, and has a small script to demonstrate her knowledge. Requirements: Knowledge of SSI (dynamic html executed by the server, rather than the browser)"
date: 2024-05-08T17:30:00.000Z
draft: false
tags: ["Hack This Site", "writeup", "challenge"]
---

**Description:**

Sam remains confident that an obscured password file is still the best idea, but he screwed up with the calendar program in Basic 7. This time he has saved the unencrypted password file in `/var/www/hackthissite.org/html/missions/basic/8/`. Also, Sam's young daughter Stephanie has just learned to program in PHP. She's talented for her age, but she knows nothing about security. She recently learned about saving files, & she wrote a script to demonstrate her ability.

**Requirements:** SSI knowledge.

**Hints:**

- This challenge's logic is similar to Basic 7, but instead of UNIX commands it uses SSI.
- When you play with Stephanie's script, pay attention to which directory the page that displays your input is in, & remember which directory the description told you that the password file is in.

**Difficulty:** Easy.

**Points:** 40

**Challenge Link:** https://www.hackthissite.org/missions/basic/8

**Forum Link:** https://www.hackthissite.org/forums/viewforum.php?f=14&t=10754

**Solution:**

From the description and requirements, we can get the idea that the SSI (Server Side Includes) directives are being used to generate dynamic content at the server side.

Here we can control the name input that is placed inside the file that have the **_.shtml_** extension so SSI injection can be possible.

We can use payload like "**_<! — #exec cmd="ls" →_**" to list the files but generated file are in "**_missions/basic/8/tmp/_**" directory but the password file that we are looking for is in "**_missions/basic/8/_**" directory so we have to go one step up. The payload:

```shtml
<!--#exec cmd="ls ../" -->
```

Output:

![Level 8.1](files/level-8-1.webp#center)

Visiting the path of "**_au12ha39vc.php_**" file we get the password for this challenge.

Happy Hacking
