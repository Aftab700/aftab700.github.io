---
title: "Basic Challenge Level 4"
description: "An email script has been set up, which sends the password to the administrator. Requirements: HTML knowledge, an email address"
summary: "An email script has been set up, which sends the password to the administrator. Requirements: HTML knowledge, an email address"
date: 2024-05-07T16:30:00.000Z
draft: false
tags: ["Hack This Site", "writeup", "challenge"]
---

**Description:**

This time Sam hardcoded the password into the script. However, the password is long & complex, & Sam is often forgetful. So he wrote a script that would email his password to him automatically, in case he forgets it.

**Requirements:**

- HTML knowledge & an email address.

**Hints:**

- The script sends the password to the administrator, but… who says it has to go to the administrator?

**Difficulty:** Easy.

**Points:** 20

**Challenge Link:** https://www.hackthissite.org/missions/basic/4

**Forum Link:**

- https://www.hackthissite.org/forums/viewforum.php?f=14&t=10749

**Solution:**

Looking in the HTML source code for "Send password to Sam" form we find the one interesting hidden input field with name="to" value="sam@hackthissite.org".

![Level 4.1](files/level-4-1.webp#center)

It seems that server will send the password to this email so we can change this to our own email address and we can receive the password.

![Level 4.2](files/level-4-2.webp#center)

And we successfully received the email with password.

Note: the email will only be sent if you provide your HackThisSite profile email address.

Happy Hacking
