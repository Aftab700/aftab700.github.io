---
title: "Basic Challenge Level 7"
description: "The password is hidden in an unknown file, and Sam has set up a script to display a calendar. Requirements: Basic UNIX command knowledge."
summary: "The password is hidden in an unknown file, and Sam has set up a script to display a calendar. Requirements: Basic UNIX command knowledge."
date: 2024-05-08T16:30:00.000Z
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
  image: "files/level-7.webp" # image path/url
  alt: "Cover: Level 7" # alt text
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

This time Sam has saved the unencrypted password in an obscurely named file saved in the challenge's directory. In other unrelated news, Sam has set up a script that returns the output from the UNIX `cal` command.

**Requirements:**

- Basic knowledge of UNIX commands.

**Hints:**

- Remember, you need to find a way to see the files in the challenge's directory.
- The calendar script takes user input & runs the cal command with it. ​What if you could inject another command?
- How can you separate commands in UNIX?

**Difficulty:** Easy.

**Points:** 35

**Challenge Link:** https://www.hackthissite.org/missions/basic/7

**Forum Link:**

- https://www.hackthissite.org/forums/viewforum.php?f=14&t=10753

**Solution:**

The script will return the output from the UNIX `cal` command. In UNIX if our input is directly appended to the `cal` command than we can inject our own command using "&&" sequence and to list the files in the directory we can use `ls` command.

So to create a payload we have to pass a valid year + && + ls.

```
2022 && ls
```

![Level 7.1](files/level-7-1.webp#center)

In this output we can see the obscurely named unencrypted password file `k1kh31b1n55h.php`, visiting this path we get the password for this challenge.

Happy Hacking
