---
title: "Basic Challenge Level 10"
description: "This time Sam used a more temporary and 'hidden' approach to authenticating users, but he didn't think about whether or not those users knew their way around javascript..."
summary: "This time Sam used a more temporary and 'hidden' approach to authenticating users, but he didn't think about whether or not those users knew their way around javascript..."
date: 2024-09-09
draft: false
tags: ["Hack This Site", "writeup", "challenge"]
---

**Description:**

- Although the challenge's title mentions JavaScript, it's not necessary (unless you're using a browser from the '90s)...

**Requirements:**

- Basic knowledge of Cookies & knowing how to manipulate them with your browser.

**Hints:**

- Take a look at the Cookies this challenge's page saves in your browser.

**Difficulty:** Easy.

**Points:** 50

**Challenge Link:** https://www.hackthissite.org/missions/basic/10

**Forum Link:**

- https://www.hackthissite.org/forums/viewforum.php?f=14&t=10756

**Solution:**

The challenge's page is saving two cookies:

- `HackThisSite`: used as a password

- `level10_authorized`: set to `no`. So we change it to `yes` and submit the password that we got from the `HackThisSite` cookie.

![Level 10 solution](files/level-10-1.png#center)

Happy Hacking

---
