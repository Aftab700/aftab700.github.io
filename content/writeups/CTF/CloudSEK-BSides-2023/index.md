---
title: "CloudSEK - BSides Cyber Security CTF 2023"
description: "Write-ups for the CloudSEK - BSides Cyber Security CTF 2023."
summary: "Solutions to the CloudSEK - BSides Cyber Security CTF 2023."
date: 2023-12-15
draft: false
author: "Aftab Sama" # ["Me", "You"] # multiple authors
tags: ["Firebase", "PHP", "CloudSEK", "CTF"]
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
---

------------------------

> ClouSEK's CTF challenge during BSides 2023


### The Automater

Points: 100
- Automate Your Way to Get the Flag
- PS: No Bruteforcing is required
- This Challange does not require you to access any other Port
- `nc 43.204.152.119 1337`

When connecting to the server we are given with double encoded text Hex > Base64 and we have to submit the Hex > Base64 decoded text in the input but doing so it keep asking for new decode text.

<img width="620" alt="image" src="/images/md/d45774ac-dc89-4ad8-9e5d-e62fb93f8727.webp">

Looking at the challenge category (`Scripting`), we can figure out that this process requires automation with the use of any scripting language. I'm am using Python here.

Python code:

```python
from pwn import *
from pwn import unhex

conn = remote('43.204.152.119', 1337)

a = conn.recvline()
print(a)
a = a.decode().split("\t")[1].split("\n")[0]
a = unhex(a)
a = b64d(a)
print(a)

for i in range(2, 102):
    print(i)
    conn.sendline(a)
    a = conn.recvline()
    print(a)
    try:
        a = a.decode().split("\t")[1].split("\n")[0]
        a = unhex(a)
        a = b64d(a)
    except IndexError as e:
        print(e)
        pass
    # print(a)
    pass

# n=101 ; flag: CloudSEK{au30ma3i0n_1s_fun}
conn.close()

```

Output:

```powershell
PS D:\GitHub\ctf> python .\1.py
[x] Opening connection to 43.204.152.119 on port 1337
[x] Opening connection to 43.204.152.119 on port 1337: Trying 43.204.152.119
[+] Opening connection to 43.204.152.119 on port 1337: Done
b'What does this mean:\t53485a75634555315231704d563370744d4467304f566c70593356445a6d744b6557466e5a45517855584a6f4d6c5a4f4e6d56436445395362464e7a4e3031764d315634596c52785745744755456c33616b453d\n'
b'HvnpE5GZLWzm0849YicuCfkJyagdD1Qrh2VN6eBtORlSs7Mo3UxbTqXKFPIwjA'
...
b'> What does this mean:\t614456444e32777a5957564b5a6a5236646b56694d464a4c5933426e57556c7056557878636b3150516c704256465a7a5a456379555852766256644f626b5a3465545a31616d733464316849553052514f54453d\n'
99
b'> What does this mean:\t526b6b7963576449536e6869646e527562565a56517a56704d564650516d464657484a735445316c656e6c7a616b3577563259324f57396b52464e514e30733056466c6a556a677a61444233576b46486457733d\n'
100
b'> What does this mean:\t4e464e5857485645565531504e6a6c79646b786c4d54565a63464651655852424d305a445a324a3653325a466232357153465a336332317363576c61595868485931524f4d6a426f556a6334536d52435357733d\n'
101
b'> CloudSEK{au30ma3i0n_1s_fun}\n'
list index out of range
[*] Closed connection to 43.204.152.119 port 1337
PS D:\GitHub\ctf>

```

Flag: `CloudSEK{au30ma3i0n_1s_fun}`

<br>

### Illusive Mind with Illusive Thoughts

Points: 100

- On 1st October, Our Underground Intelligence Team observed a post at the Dark Web, where an hacker claiming to have whole Database dump of the CSP Bank [Central Public Bank] and was selling it for $5000.
- Soon our security research team started digging further to find out the root cause of this leak, as CSP Bank’s web assets scope were limited and properly secured, we didn’t find anything. Then our team indexed all the apps belongs to the CSP Bank at [Bevigil](https://bevigil.com/) (World’s first security engine for mobile apps) and started performing their research.
- Later they came to know that [CSP Bank](https://bevigil.com/osint-api?query=com.intl.cspbank&criteria=package) Firebase database were misconfigured i.e open to the public through one can get the sensitive information to chain it further.
- Moving further, our team checks the other app of the company and noticed something suspicious at the “Unknown High Entropy String” rule of the Bevigil which gave the credentials of the DB through which we accessed the Database having Admin Privilege.
- Soon, we documented the detailed research & notified to the compromised company about this incident.
- Flag format: Once you get it, you would know it.
- Note: Some apps of the CSP bank has been deindexed, so one has to find out a way to reach the other apps.
- https://bevigil.com/osint-api
- Hint
    - You can search for all the URL present inside a Package on the Bevigil Asset Explorer
    - Bevigil Asset Explorer: https://bevigil.com/osint-api?query=com.intl.cspbank&criteria=package

We can use https://bevigil.com/ and search for `CSP Bank`, we get this result https://bevigil.com/report/com.intl.cspbank?section=assets

In this section under ASSETS we see `Firebase URL` Rule\
Here we see that it is exposed in `com.intl.cspbank/source/sources/com/intl/cspbank/constants.java` [file](https://bevigil.com/src/com.intl.cspbank/source%2Fsources%2Fcom%2Fintl%2Fcspbank%2Fconstants.java)

Firebase URL is: `https://csp-bank-default-rtdb.firebaseio.com`

From the description we know that this Firebase database is misconfigured and open to the public so we try to access the database by visiting `\.json` file on url

`https://csp-bank-default-rtdb.firebaseio.com/.json`

we are able to see the database content.\
In this file we see one entry on index 45, line 317

```json
"45": {
        "Account Name": "Central Public Bank",
        "DB_URL": "https://mysql_db.cspbank.com",
        "ID": "Y29tLmludGwuY3NwY2FyZA=="
    }
```

In this the value "ID" is base64 encoded, by base64 decoding this we get `com.intl.cspcard`

`cspcard` is new app name so we search this on https://bevigil.com/ and we get this https://bevigil.com/report/com.intl.cspcard?section=strings

There is one "Unknown High Entropy String" rule in this report and it is also mentioned in description of challenge.

It is exposed in `com.intl.cspcard/source/sources/com/intl/cspcard/sec_data.java` this [file](https://bevigil.com/src/com.intl.cspcard/source%2Fsources%2Fcom%2Fintl%2Fcspcard%2Fsec_data.java)

when we analyze this file we get `the_key` string which is long hex.

```java
private final String the_key = "D8 FF 20 FF 20 E0 20 00 20 10 20 42 20 46 20 21 20 11 20 00 20 01 20 00 20 48 20 6E 20 27 20 5F 20 2E 20 5F 20 2E 20 73 20 6F 20 6D 20 65 20 52 20 61 20 6E 20 64 20 6F 20 6D 20 43 20 68 20 61 20 72 20 61 20 63 20 74 20 65 20 72 20 73 20 2E 20 5F 20 2E 20 5F 20 0A 44 0A 20 6F 6F 6E 20 74 74 73 72 6F 20 65 61 68 64 72 6F 63 65 64 2F 64 6E 65 6F 63 65 64 20 64 72 63 64 65 6E 65 69 74 6C 61 20 73 6E 69 74 20 65 68 63 20 64 6F 2E 65 20 0A 43 0A 6E 6F 72 67 74 61 2C 73 59 20 75 6F 6D 20 64 61 20 65 74 69 20 2E 65 48 65 72 69 20 20 73 6F 79 72 75 66 20 61 6C 21 67 43 0A 6F 6C 64 75 45 53 5F 4B 65 42 69 56 69 67 2D 6C 64 7B 5F 62 64 61 69 6D 3A 6E 64 61 69 6D 40 6E 38 39 7D 37 0A 0A 43 2D 6F 6C 64 75 45 53 20 4B 65 53 75 63 69 72 79 74 54 20 61 65 0A 6D 5F 20 2E 20 5F 20 2E 20 73 20 6F 20 6D 20 65 20 52 20 61 20 6E 20 64 20 6F 20 6D 20 43 20 68 20 61 20 72 20 61 20 63 20 74 20 D8 20 FF 20 E0 20 FF 20 10 48 69 6E 74 2D 4A 46 49 46 20 D8 20 FF 20 E0";
```

Decoding this from hex we get somthing like this:

```
D
 oon ttsro eahdroced/dneoced drcdeneitla snit ehc do.e 
C
norgta,sY uom da eti .eHeri  soyruf al!gC
olduES_KeBiVig-ld{_bdaim:ndaim@n89}7

C-olduES KeSucirytT ae
```

if we look carefully we realize that every 2 characters are swaped we can use python to get the message

```python
a = """D
 oon ttsro eahdroced/dneoced drcdeneitla snit ehc do.e 
C
norgta,sY uom da eti .eHeri  soyruf al!gC
olduES_KeBiVig-ld{_bdaim:ndaim@n89}7

C-olduES KeSucirytT ae"""

for i in range(0, len(a), 2):
    print(a[i+1],a[i], end="", sep="")
```

Output:

```shell
Do not store hardcoded/encoded credentials in the code.

Congrats, You made it. Here is your flag!
CloudSEK_BeVigil-{db_admin:admin@987}

-CloudSEK Security Tea
```

Flag: `CloudSEK_BeVigil-{db_admin:admin@987}`

<br>

### Hack the Wires

Points: 100

- Recently, we got an email from an anonymous person reporting that a Hacker has setted a proxy for Bevigil which allows anyone from the internet to use Bevigil for Free and Unlimited. He might has Stolen a session cookie from our internal CloudSters and used that in the proxy. We blindly can’t expire all the session’s cookies for user experience, so we need to figure out the Particular session cookie and expire that only.
- The anonymous person has also shared an android application naming Bevigil for Free and Unlimited hosted at BeVigil where an attacker has stored the Proxy URL in the app’s assets [IPs, URLs, Hostnames, etc] & his details for publicity stunt.
- Could you help us to find out the same cookie so that we can revoke it as soon as possible!!
- https://bevigil.com/report/com.intl.bevigilunlimited

In [this](https://bevigil.com/report/com.intl.bevigilunlimited) report after looking in assets we get [this file](https://bevigil.com/src/com.intl.bevigilunlimited/source%2Fresources%2Fres%2Fvalues%2Fstrings.xml) `com.intl.bevigilunlimited/source/resources/res/values/strings.xml` which contains the proxy URL

In this xml file we get this url:

```xml
<string name="proxyUrlBackup">https://webctf.cloudsek.com/hack-in-the-wires</string>
```

In the source code of this given url we get the following comment:

```html
<!--
  $cookie = file_get_contents("/cookies.txt");
  if ($_GET['getData']){
      if(preg_match("/^http.[:]\/\/(bevigil.com\/)./", $_GET['url'];)){
          $response = file_get_contents($_GET['url'];, false, $cookiesAndHeaders);
      }else{
          $response = false;
      }

  }-->
```

by analyzing this php code we can divide this process in 3 steps
1. GET parameter `getData=true` to satisfy the first if condition
2. value of GET parameter `url` should match the regex `^http.[:]\/\/(bevigil.com\/).`
3. use LFI in `url` parameter to read the `/cookies.txt`

first condition is easy just include `getData=true` in GET request

for the seconde step let's understand the regex
- `^http`: it means the string should start with `http`
- following `.` means any one character
- `\/\/` it means `//`
- `(bevigil.com\/)` it means a group in first it start with `bevigil` + `.` meaning any one character + `com` + `/`
- last `.` meaning any character

for example: `https://bevigil.com/a` this will match the regex

but trying LFI in this dose not work so i will use [online php editor](https://tio.run/#php) to debug the payload

In this online editor i'm using payload=`echo file_get_contents("https://bevigil.com/../../.code.tio");`\
In the debug section we can see following warning:

```
PHP Warning:  file_get_contents(): Unable to find the wrapper "https" - did you forget to enable it when you configured PHP? in /home/runner/.code.tio on line 3
```
 It is trying to parse the http protocall so now we have make sure it dose not identify our payload as http url so we can read the local file\
 for this we have `.` in regex after http so first i tried different characters like `httpq`, `httpd` but it still identify it as http\
 then i tried special characters, `:` works now in editor payload=`echo file_get_contents("http:://bevigil.com/../../.code.tio");` works so now we just need to try
 few `../` to get `/cookies.txt`

finally the payload=`http:://bevigil.com/../../../../../cookies.txt` give us the flag

```
https://webctf.cloudsek.com/hack-in-the-wires?getData=true&url=http:://bevigil.com/../../../../../cookies.txt
```

Flag: `CloudSEK{3FI_i$_C00!}`

Happy Hacking
