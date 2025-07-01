---
title: "Basic Challenge Level 3"
description: "Some intuition is needed to find the location of the hidden password file. Requirements: Basic HTML knowledge"
summary: "Some intuition is needed to find the location of the hidden password file. Requirements: Basic HTML knowledge"
date: 2024-05-07T14:30:00.000Z
draft: false
tags: ["Hack This Site", "writeup", "challenge"]
---

**Description:**

- This time Sam remembered to upload the password file, but there were deeper problems than that.

**Requirements:**

- Basic knowledge of HTML & directory structure understanding.

**Hints:**

- This time Sam remembered to upload the password file, so… maybe you can find it?

**Difficulty:** Easy.

**Points:** 15

**Challenge Link:** https://www.hackthissite.org/missions/basic/3

**Forum Link:**

- https://www.hackthissite.org/forums/viewforum.php?f=14&t=10748

**Solution:**

Looking in the HTML source code for password submit form we find the one interesting hidden input field with name="file" value="password.php".

![Level 3 solution.1](files/level-3-sol-1.webp#center)

Looks like the password file that Sam uploaded. Visiting this path, we can access the password.php file and it gives us the password that we are looking for.

![Level 3 solution.2](files/level-3-sol-2.webp#center)

Happy Hacking
