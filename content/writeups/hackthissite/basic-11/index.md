---
title: "Basic Challenge Level 11"
description: "Sam decided to make a music site. Unfortunately he does not understand Apache. This mission is a bit harder than the other basics."
summary: "Sam decided to make a music site. Unfortunately he does not understand Apache. This mission is a bit harder than the other basics."
date: 2024-09-10T10:36:30.028Z
draft: false
tags: ["Hack This Site", "writeup", "challenge"]
---

**Description:** `Not Available`

**Requirements:** `Not Available`

**Hints:**

- What is a directory index?
- How does Apache keep users from seeing certain files within a directory?

**Difficulty:** Easy-ish.

**Points:** 55

**Challenge Link:** https://www.hackthissite.org/missions/basic/11

**Forum Link:**

- https://www.hackthissite.org/forums/viewforum.php?f=14&t=10757

**Solution:**

By reloading the page, different Elton John songs are displayed.

![Level 11-elton john songs](files/level-11-1.png#center)

When we navigate to the `e/` directory, we notice that directory listing is enabled.

![Level 11-directory listing enabled](files/level-11-2.png#center)

The `.htaccess` Apache configuration file is accessible in the last directory, `e/l/t/o/n/`.

![Level 11-.htaccess file](files/level-11-3.png#center)

There is a file named `DaAnswer`.

![Level 11-DaAnswer file](files/level-11-4.png#center)

This is tricky, but the answer is **`simple`**.

We sumbit can `simple` as a password in `index.php`.


Happy Hacking

---
