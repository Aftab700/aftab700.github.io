---
title: "Install and Set Up Unbound DNS Server in Arch Linux"
description: "How to Install and Set Up Unbound DNS Server in Arch Linux."
summary: "How to Install and Set Up Unbound DNS Server in Arch Linux."
date: 2026-01-07
draft: false
tags: ["Unbound", "DNS", "Arch", "Linux"]
---

## Install Unbound

You can use any package manager of your choice. For me it's `pacman`.

```sh
sudo pacman -Syu unbound
```

Backup the default configuration file, which is located at `/etc/unbound/unbound.conf`.

```sh
sudo cp /etc/unbound/unbound.conf /etc/unbound/unbound.conf.bak
```

Edit `/etc/unbound/unbound.conf` file.

```conf
include: "/etc/unbound/conf.d/*.conf"
server:
        num-threads: 4
        interface: ::1
        interface: 127.0.0.1
        port: 53
        so-rcvbuf: 4m
        msg-cache-size: 50m
        msg-cache-slabs: 4
        rrset-cache-size: 100m
        rrset-cache-slabs: 4
        infra-cache-slabs: 4
        do-ip4: yes
        do-udp: yes
        do-tcp: yes
        access-control: 127.0.0.0/8 allow
        access-control: ::1 allow
        access-control: ::ffff:127.0.0.1 allow
        chroot: "/etc/unbound"
        username: "unbound"
        directory: "/etc/unbound"
        use-syslog: yes
        log-time-ascii: yes
        log-queries: yes
        log-servfail: yes
        root-hints: "root.hints"
        hide-identity: yes
        hide-version: yes
        hide-http-user-agent: yes
        harden-glue: yes
        qname-minimisation: yes
        prefetch: yes
        prefetch-key: yes
        minimal-responses: yes
        auto-trust-anchor-file: "root.key"
        key-cache-slabs: 4
        tls-cert-bundle: "/etc/ssl/certs/ca-certificates.crt"
```

## Fetch Root Hints and DNSSEC Key

Unbound needs to know where the "root" servers of the internet are.

Download Root Hints:
```sh
sudo curl -o /etc/unbound/root.hints https://www.internic.net/domain/named.cache
```

Initialize DNSSEC:
```sh
sudo unbound-anchor -a /etc/unbound/root.key
```

Fix permissions:
```sh
sudo chown unbound:unbound /etc/unbound/root.key
sudo chown unbound:unbound /etc/unbound/
sudo mkdir -p /etc/unbound/conf.d/
```

## Directing System Traffic to Unbound

We need to tell our network configuration tool to use `127.0.0.1` (local Unbound server) for DNS lookups. NetworkManager is the standard and most used in Linux.

Edit `/etc/NetworkManager/NetworkManager.conf`:
```conf
[main]
dns=none
```

Edit `/etc/resolv.conf`:
```conf
nameserver 127.0.0.1
nameserver ::1
options edns0 trust-ad
```

### Optional:

To prevent overwriting this file, run:
```sh
sudo chattr +i /etc/resolv.conf 
```

## Start and Enable the Unbound Service

Now, fire up the Unbound engine:
```sh
sudo systemctl enable --now unbound
```

Verify the status of the Unbound service:
```sh
systemctl status unbound
```

If it says active (running), you are good to go!

## Verify the Setup

Run a DNS lookup and check the "SERVER" field in the output. It should point to `127.0.0.1`.
```sh
drill google.com
```

Expected output:
```sh
;; ->>HEADER<<- opcode: QUERY, rcode: NOERROR, id: 29355
;; flags: qr rd ra ; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0 
;; QUESTION SECTION:
;; google.com.  IN      A

;; ANSWER SECTION:
google.com.     300     IN      A       142.250.70.78

;; AUTHORITY SECTION:

;; ADDITIONAL SECTION:

;; Query time: 102 msec
;; SERVER: 127.0.0.1
;; WHEN: Wed Jan  7 17:26:01 2026
;; MSG SIZE  rcvd: 44
```

## Using "Forward Zones"

You can use forwarding if you prefer to let a faster provider handle the recursion while you still enjoy Unbound's local caching and DNSSEC validation.

For me i need to use forwarder for some wifi AP because the ISP keeps hijacking DNS requests, so the DNSSEC would fail. To solve this i use DNS forwarding over tls so ISP can't hijack the DNS requests.

To do this just add new `.conf` file in `/etc/unbound/conf.d/` directory. I'm using cloudflare dns over tls, so the setup would look like this:

File: `/etc/unbound/conf.d/cloudflare.conf`

```conf
# Forward all DNS queries to Cloudflare over TLS
forward-zone:
    name: "."
    forward-tls-upstream: yes
    forward-addr: 1.1.1.1@853#cloudflare-dns.com
    forward-addr: 1.0.0.1@853#cloudflare-dns.com
    forward-addr: 2606:4700:4700::1111@853#cloudflare-dns.com
    forward-addr: 2606:4700:4700::1001@853#cloudflare-dns.com
```

And, restart the Unbound service:

```sh
sudo systemctl restart unbound
```

To stop the forwarding, simply rename the extension of the file to something else:

```sh
sudo mv /etc/unbound/conf.d/cloudflare.conf /etc/unbound/conf.d/cloudflare.conf.bak
```

## DNS blocklist

If you want to use dns blocklist like [oisd](https://oisd.nl/setup/unbound), download the unbound conf file for that and place it in `/etc/unbound/conf.d/` directory.

```sh
sudo curl -o /etc/unbound/conf.d/block-oisd_big.conf https://big.oisd.nl/unbound
```

## Troubleshooting

### Check Unbound Logs

If you encounter any issues, check the logs:
```sh
journalctl -u unbound
```

<br>

Happy Hacking

<br>

---
