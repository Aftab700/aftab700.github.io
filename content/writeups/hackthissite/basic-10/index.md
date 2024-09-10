---
title: "Basic Challenge Level 10"
description: "This time Sam used a more temporary and 'hidden' approach to authenticating users, but he didn't think about whether or not those users knew their way around javascript..."
summary: "This time Sam used a more temporary and 'hidden' approach to authenticating users, but he didn't think about whether or not those users knew their way around javascript..."
date: 2024-09-09
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
  image: "files/level-10.png" # image path/url
  alt: "Cover: Level 10" # alt text
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
