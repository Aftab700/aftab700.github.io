---
title: "Burp Suite Certified Practitioner (BSCP) Review + Tips/Tricks"
description: "Burp Suite Certified Practitioner (BSCP) review, tips/tricks etc."
summary: "Burp Suite Certified Practitioner (BSCP) review, tips/tricks etc."
date: 2024-11-30
draft: false
author: "Aftab Sama" # ["Me", "You"] # multiple authors
tags: ["BSCP", "Exam", "Review", "certification"]
canonicalURL: ""
showToc: true
TocOpen: false
TocSide: 'right'  # or 'left'
# weight: 1
# aliases: ["/first"]
hidemeta: false
comments: true
youtube_embed: true
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
# cover:
#     image: "<image path/url>" # image path/url
#     alt: "<alt text>" # alt text
#     caption: "<text>" # display caption under cover
#     relative: false # when using page bundles set this to true
#     hidden: true # only hide on current single page
# editPost:
#     URL: "https://github.com/"
#     Text: "Suggest Changes" # edit text
#     appendFilePath: true # to append file path to Edit link
---

## About Exam

### What is BSCP

The Burp Suite Certified Practitioner exam is a challenging practical examination designed to demonstrate your web security testing knowledge and Burp Suite skills. To pass the certification exam, you are required to demonstrate an in-depth knowledge of a wide range of vulnerability classes, and the Burp Suite functionality required to support you in discovery, understanding, and exploitation.

### Cost

The certification cost $99, and it expires after five years.
Once you purchase your Burp Suite Certified Practitioner exam, you have 12 months to use it before it expires.

### Proctoring

The exam uses a third-party automated proctoring service called Examity. It is used to verify your identity at the beginning of the exam and takes about 5 minutes to complete. After that, you can close that Examity window. You don't need to keep your camera and microphone on throughout the exam.

### How to prepare

Before you take your real exam, make sure to complete [this](https://portswigger.net/web-security/certification/how-to-prepare) four-step preparation guide by PortSwigger.

### Exam structure

You will have four hours to complete the Burp Suite Certified Practitioner exam. There are two applications, and each application contains deliberate vulnerabilities. This means that each application can be completed in three stages:

1. **Stage 1**: Access any user account.
2. **Stage 2**: Use your user account to access the admin interface, perhaps by elevating your privileges or compromising the administrator account.
3. **Stage 3**: Use the admin interface to read the contents of `/home/carlos/secret` from the server's filesystem, and submit it using "submit solution".

### Important things to remember

Part of being a professional is handling responsibility. While exploiting each application, you will gain access to powerful functionality. If you use this to delete your own account or a core system component, you may make your exam impossible to complete.

Once you have started the exam timer, there is no option to pause or reset your exam. If you wish to retake the exam, you will need to purchase another exam and begin the process again.

You must use a Burp project file for the full period of the exam and submit that project file for analysis.


----
## Tips & Tricks
### Some Tips

- There are two applications, each with three stages: `user`->`Admin`->`Read File on Server`.
	- These three stages are expected to be completed in order. Attempting to break into the admin interface if you haven't yet got access to a user account or attempting to read files if you don't have access to an admin account is a waste of time.
- Outbound traffic from the vulnerable servers to the internet will be restricted. You won't be able to connect back to any internet server, except for the public Burp Collaborator server and the integrated exploit server.
- Scanning selected pages and insertion points with Burp Suite Professional will often help you quickly progress through the exam.
- Improve your general discovery skills by working through some mystery labs and leaving the topic random to challenge yourself further.
- If you find an SSRF vulnerability, you can use it to read files by accessing an internal-only service running on localhost on port 6566.
- There will be one active user who will visit the homepage of the site every 15 seconds and click any links in any emails they receive from the application.
- There is always an administrator account with the username "**administrator**", plus a lower-privileged account usually called "**carlos**". If you find a username enumeration vulnerability, you may be able to break into a low-privileged account using the following [username list](https://portswigger.net/web-security/authentication/auth-lab-usernames) and [password list](https://portswigger.net/web-security/authentication/auth-lab-passwords).


### More Tips

Finding a vulnerability isn't enough. You also need to exploit it. This could involve chaining it to other vulnerabilities and demonstrating the actual security impact.
You may get caught out by a filter. So keep your payloads/poc ready for different scenarios you may face.
For this, you can make your own notes to quickly search and find the relevant payload, or you can use the other existing cheatsheets that others have already made.
- Reference:
	- [Obfuscating attacks using encodings](https://portswigger.net/web-security/essential-skills/obfuscating-attacks-using-encodings)
	- [Cross-site scripting (XSS) cheat sheet](https://portswigger.net/web-security/cross-site-scripting/cheat-sheet)
	- [SQL injection cheat sheet](https://portswigger.net/web-security/sql-injection/cheat-sheet)
	- [Lab cheatsheet - DingyShark](https://github.com/DingyShark/BurpSuiteCertifiedPractitioner)
	- [Lab cheatsheet - botesjuan](https://github.com/botesjuan/Burp-Suite-Certified-Practitioner-Exam-Study)
	- [BSCP cheatsheet](https://bscpcheatsheet.gitbook.io/exam)
	- [Payloads All The Things](https://swisskyrepo.github.io/PayloadsAllTheThings/)

Setup and configure all the tools that you may need in the exam, like [ysoserial](https://github.com/frohoff/ysoserial), [PHPGGC](https://github.com/ambionics/phpggc), [sqlmap](https://github.com/sqlmapproject/sqlmap), Burp Extensions, etc., and get yourself familiar with using them. because the exam timing is short, you can't waste any time configuring the tools.
While taking the practice exam, I didn't have `ysoserial` installed, and when I installed it, my current Java version was not supported by the tool, so I had to install the different Java version during the exam. Don't do this type of mistakes.

Take the snapshot of the VM after setting up all the tools.

The exam stages are linear. If you don't get the first stage (normal user account), You never know which vulnerabilities will be there in the following stage. The above reference links also contain information on what types of vulnerabilities you may get at different stages. 

You may fall into a rabbit hole, so allocate your time carefully. If you found something but are not getting anything even after putting in a lot of time, take a note of it and look at some other place. Maybe you need to chain it with something else.

### My Thoughts on Exam


Was it easy? No. I wouldn't say it was easy. The Black Box approach to the exam makes it difficult. It is similar to a practice exam, but slightly more difficult. However, Each person's experience is different.

Get comfortable with mystery labs and review all the lab solutions before attempting the exam.

The burp scanner was a great help and exam timing feels short to complete all 6 stages.

If you prefer video mode, then this excellent [YouTube video](https://www.youtube.com/watch?v=L-3jJTGLAhc) is perfect for someone who is looking for BSCP exam review + tips/tricks.

https://portswigger.net/web-security/e/c/d1810975205c9a28

<br>

Happy Hacking
