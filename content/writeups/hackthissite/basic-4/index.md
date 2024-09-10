---
title: "Basic Challenge Level 4"
description: "An email script has been set up, which sends the password to the administrator. Requirements: HTML knowledge, an email address"
summary: "An email script has been set up, which sends the password to the administrator. Requirements: HTML knowledge, an email address"
date: 2024-05-07T16:30:00.000Z
draft: false
author: "Aftab Sama" # ["Me", "You"] # multiple authors
tags: ["Hack This Site", "writeup", "challenge"]
canonicalURL: ""
showToc: true
TocOpen: false
TocSide: "right" # or 'left'
# weight: 1
# aliases: ["/first"]
hidemeta: false
comments: true
disableHLJS: true # to disable highlightjs
disableShare: true
hideSummary: false
searchHidden: false
ShowReadingTime: true
ShowBreadCrumbs: true
ShowPostNavLinks: true
ShowWordCount: true
ShowRssButtonInSectionTermList: true
UseHugoToc: true
cover:
  image: "files/level-4.webp" # image path/url
  alt: "Cover: Level 4" # alt text
  caption: "" # display caption under cover
  relative: true # when using page bundles set this to true
  hiddenInSingle: false
  hidden: false # only hide on current single page
# editPost:
#     URL: "https://github.com/"
#     Text: "Suggest Changes" # edit text
#     appendFilePath: true # to append file path to Edit link
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
