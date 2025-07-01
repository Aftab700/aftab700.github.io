---
title: "How to Setup BIND DNS Server on Windows"
description: "Install and set up the BIND DNS server on Windows."
summary: "Install and set up the BIND DNS server on Windows."
date: 2024-09-04
draft: false
tags: ["BIND", "DNS", "Windows"]
---

In this blog, we will install and configure the BIND DNS server on Windows. My motivation for this was to use a wildcard DNS record for a domain because the `etc/hosts` file doesn't support wildcards.

Why <abbr title="Berkeley Internet Name Domain">BIND</abbr>? Because BIND is the most commonly used DNS server software on the Internet and it is **open-source** software.

## Installing BIND

### Download Bind9 for windows

Download BIND for Windows from here:

```
ftp://ftp.isc.org/isc/bind9/9.16.50/BIND9.16.50.x64.zip
```

### Installing BIND

- Run the `BINDInstall.exe` as an administrator.
- Enter the service account name and password.
- If all goes well, you will see the message, BIND installation completed successfully.

![BIND installation image](images/bind-install.png#center)

### Add BIND to your PATH

Add the `Bind Installation Path/bin` to the Path Environment Variable.

### Set the correct filesystem permission

- Right-click on the BIND installation folder, go to `Properties` > `Security` > `Edit`.
- Click on Add.
- Type the name of the service account name (e.g., `named`) you specified during installation.
- Tick the Allow box for both Modify and Write.
- Full control is not required (and, for security purposes, should not be granted).


## Configuring BIND

Inside the BIND installation folder, create two directories: `zones` and `logs`.

BIND 9 uses a single configuration file called `named.conf`.

### *`etc/named.conf`* file

```conf
include "C:\Program Files\ISC BIND 9\etc\named.conf.options";
include "C:\Program Files\ISC BIND 9\etc\named.conf.local";
include "C:\Program Files\ISC BIND 9\etc\named.conf.logging";
```

### *`etc/named.conf.local`* file

```conf
zone "." {
  type hint;
  file "C:\Program Files\ISC BIND 9\zones\named.root";
};

zone "htb" {
     type master;
     file "C:\Program Files\ISC BIND 9\zones\htb.zone";
};

zone "oastify.com" {
     type master;
     file "C:\Program Files\ISC BIND 9\zones\burp.zone";
};
```

### *`etc/named.conf.logging`* file

<details><summary markdown="span">Click to see code:</summary>

```
logging {
     channel default_log {
          file "C:\Program Files\ISC BIND 9\logs\default.log";
          print-time yes;
          print-category yes;
          print-severity yes;
          severity info;
     };
     channel auth_servers_log {
          file "C:\Program Files\ISC BIND 9\logs\auth_servers.log";
          print-time yes;
          print-category yes;
          print-severity yes;
          severity info;
     };
     channel dnssec_log {
          file "C:\Program Files\ISC BIND 9\logs\dnssec.log";
          print-time yes;
          print-category yes;
          print-severity yes;
          severity info;
     };
     channel zone_transfers_log {
          file "C:\Program Files\ISC BIND 9\logs\zone_transfers.log";
          print-time yes;
          print-category yes;
          print-severity yes;
          severity info;
     };
     channel ddns_log {
          file "C:\Program Files\ISC BIND 9\logs\ddns.log";
          print-time yes;
          print-category yes;
          print-severity yes;
          severity info;
     };
     channel client_security_log {
          file "C:\Program Files\ISC BIND 9\logs\client_security.log";
          print-time yes;
          print-category yes;
          print-severity yes;
          severity info;
     };
     channel rate_limiting_log {
          file "C:\Program Files\ISC BIND 9\logs\rate_limiting.log";
          print-time yes;
          print-category yes;
          print-severity yes;
          severity info;
     };
     channel rpz_log {
          file "C:\Program Files\ISC BIND 9\logs\rpz.log";
          print-time yes;
          print-category yes;
          print-severity yes;
          severity info;
     };
     channel dnstap_log {
          file "C:\Program Files\ISC BIND 9\logs\dnstap.log";
          print-time yes;
          print-category yes;
          print-severity yes;
          severity info;
     };
     channel queries_log {
          file "C:\Program Files\ISC BIND 9\logs\queries.log";
          print-time yes;
          print-category yes;
          print-severity yes;
          severity info;
     };
     channel query-errors_log {
          file "C:\Program Files\ISC BIND 9\logs\query-errors.log";
          print-time yes;
          print-category yes;
          print-severity yes;
          severity dynamic;
     };
     channel default_syslog {
          print-time yes;
          print-category yes;
          print-severity yes;
          syslog daemon;
          severity info;
     };
     channel default_debug {
          print-time yes;
          print-category yes;
          print-severity yes;
          file "named.run";
          severity dynamic;
     };
     category default { default_syslog; default_debug; default_log; };
     category config { default_syslog; default_debug; default_log; };
     category dispatch { default_syslog; default_debug; default_log; };
     category network { default_syslog; default_debug; default_log; };
     category general { default_syslog; default_debug; default_log; };
     category zoneload { default_syslog; default_debug; default_log; };
     category resolver { auth_servers_log; default_debug; };
     category cname { auth_servers_log; default_debug; };
     category delegation-only { auth_servers_log; default_debug; };
     category lame-servers { auth_servers_log; default_debug; };
     category edns-disabled { auth_servers_log; default_debug; };
     category dnssec { dnssec_log; default_debug; };
     category notify { zone_transfers_log; default_debug; };
     category xfer-in { zone_transfers_log; default_debug; };
     category xfer-out { zone_transfers_log; default_debug; };
     category update{ ddns_log; default_debug; };
     category update-security { ddns_log; default_debug; };
     category client{ client_security_log; default_debug; };
     category security { client_security_log; default_debug; };
     category rate-limit { rate_limiting_log; default_debug; };
     category spill { rate_limiting_log; default_debug; };
     category database { rate_limiting_log; default_debug; };
     category rpz { rpz_log; default_debug; };
     category dnstap { dnstap_log; default_debug; };
     category trust-anchor-telemetry { default_syslog; default_debug; default_log; };
     category queries { queries_log; };
     category query-errors {query-errors_log; };
};
```
</details>

### *`etc/named.conf.options`* file

```
options {
          directory "C:\Program Files\ISC BIND 9\zones";    # Sets the location of the root hints file
          recursion yes;                                    # Allows recursive queries (looking-up unknown hosts)
          allow-recursion { any; };                         # Allows any DNS client to make recursive queries
          listen-on { any; };                               # Listen on all IPv4 addresses (but not IPv6)
          listen-on-v6 { any; };
          allow-query { any; };
          allow-transfer { none; };                         # disable zone transfers by default
          version none;                                     # Prevents attackers getting the BIND version
          prefetch 10 60;                                   # Prefetches any cached record with a TTL > 60 seconds when it gets to within 10 seconds of expiry)
          rate-limit { responses-per-second 10; };          # Tries to limit DNS DDoS attacks
          querylog yes;                                     # Ensure query logging is enabled
          #blackhole {                                      # Drop queries that result in IPs for these ranges
          #    10/8;                                        #  - remove this line if you are running on a 10.x.y.z network
          #    172.16/12;                                   #  - remove this line if you are running on a 172.16.x.y network
          #    192.168/16;                                  #  - remove this line if you are running on a 192.168.x.y network
          #};
          // Forward DNS queries to public DNS resolvers
          forwarders {
            8.8.8.8;        // Google Public DNS
            8.8.4.4;        // Google Public DNS
            1.1.1.1;        // Cloudflare DNS
            1.0.0.1;        // Cloudflare DNS
            192.168.0.1;    // Default DNS
          };
          // indicates all queries will be forwarded other than for defined zones
          //forward only;
          dnssec-validation auto;                           # sets the DNS root zone as the trust anchor for DNSSEC
          // Other options
          auth-nxdomain no;    // Conform to RFC1035
};
```

### Zone files

#### *`zones/burp.zone`* file

```zone
$TTL 3600
@    IN    SOA   ns1.oastify.com. admin.oastify.com. (
                6 ; Serial
                3600       ; Refresh
                1800       ; Retry
                1209600    ; Expire
                3600 )     ; Minimum TTL

@    IN    NS    ns1.oastify.com.
@    IN    NS    ns2.oastify.com.

ns1  IN    A     3.248.33.252
ns2  IN    A     54.77.139.23

@  IN    A     3.248.33.252
@  IN    A     54.77.139.23

*    IN    CNAME PublicInteractionNLB-3bddf5ff6abb91b6.elb.eu-west-1.amazonaws.com.
```


#### *`zones/htb.zone`* file

```zone
$TTL 86400
@    IN    SOA   ns1.htb. admin.htb. (
            2024091201 ; Serial
            3600       ; Refresh
            1800       ; Retry
            1209600    ; Expire
            86400 )    ; Minimum TTL

     IN    NS    ns1.htb.

ns1  IN    A     192.168.1.1

*    IN    A     192.168.1.2
```


#### *`named.root`* file

Run this command in the `zones` directory:

```shell
dig NS . @m.root-servers.net > named.root
```

or download it from [here](https://www.internic.net/domain/named.root).

### Generating the RNDC keyfile

Run the following command to generate the RNDC keyfile:

```shell
rndc-confgen -a
```

You should see the following message: `wrote key file "C:\Program Files\ISC BIND 9\etc\rndc.key"`

## Start Bind

In windows Go to `Services` and find the `ISC BIND` service, and click Start.
Status will change to running.

Verify if it's running using the dig command:

```shell
dig +short '@127.0.0.1' www.aftabsama.com
```

![dig command output](images/dig-command-output.png#center)

## Troubleshooting

- Go to `Event Viewer` > `Windows Logs` > `Application` and filter by the event source named to see the problem.
- Check the log files in `logs` folder.

### Allow BIND through firewall

If you are facing network connectivity issues, try changing firewall rules.

- If the connection is blocked, go to `Control Panel` > `System and Security` > `Windows Defender Firewall` > Allow an app or feature through Windows Defender Firewall.
- Click on Change settings > Allow another app...
- Browse to the BIND executable (e.g., `bin/named.exe`), select it, and click Add.

<br>

Happy Hacking
