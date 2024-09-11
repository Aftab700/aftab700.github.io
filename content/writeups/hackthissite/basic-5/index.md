---
title: "Basic Challenge Level 5"
description: "Similar to the previous challenge, but with some extra security measures in place. Requirements: HTML knowledge, JS or FF, an email address."
summary: "Similar to the previous challenge, but with some extra security measures in place. Requirements: HTML knowledge, JS or FF, an email address."
date: 2024-05-08T14:30:00.000Z
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
  image: "files/level-5.webp" # image path/url
  alt: "Cover: Level 5" # alt text
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

Sam has gotten wise to all the people who wrote their own forms to get the password. Rather than actually learning the password, he decided to make his email program a little more secure.

**Requirements:**

- HTML knowledge & an email address.

**Hints:**

- The script sends the password to the administrator, but… who says it has to go to the administrator?

**Difficulty:** Easy.

**Points:** 25

**Challenge Link:** https://www.hackthissite.org/missions/basic/5

**Forum Link:**

- https://www.hackthissite.org/forums/viewforum.php?f=14&t=10750

**Solution:**

Looking in the HTML source code for "Send password to Sam" form we find the one interesting hidden input field with name="to" value="sam@hackthissite.org".

![Level 5.1](files/level-5-1.webp#center)

It seems that server will send the password to this email so we can change this to our own email address and we can receive the password.

![Level 5.2](files/level-5-2.webp#center)

![Level 5.3](files/level-5-3.webp#center)

And we successfully received the email with password.

Note: the email will only be sent if you provide your HackThisSite profile email address.

Happy Hacking