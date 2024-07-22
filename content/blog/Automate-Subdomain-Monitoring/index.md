---
title: "Automate Subdomain Monitoring"
description: "Set up an automated system to monitor and alert for newly discovered subdomains."
summary: "Set up an automated system to monitor and alert for newly discovered subdomains."
date: 2024-07-14
draft: false
author: "Aftab Sama" # ["Me", "You"] # multiple authors
tags: ["Automation"]
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
UseHugoToc: true
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

# Automate Subdomain Monitoring

Set up an automated system to monitor and alert for newly discovered subdomains.

## Tool used:
- [notify](https://github.com/projectdiscovery/notify)
- [haktrails](https://github.com/hakluke/haktrails)
- [subfinder](https://github.com/projectdiscovery/subfinder)
- [anew](https://github.com/tomnomnom/anew)


We will use `haktrails` and `subfinder` for subdomain enumeration. You can also use other tools of your choice such as owasp-amass. Additionally, we will use `notify` to send notifications. `notify` can be configured to send results to various platforms including Slack, Discord, Telegram, Google Chat, Pushover, SMTP, and custom webhooks.

## Configuration File Setup

### haktrails

To use haktrails, you'll need to set up your [config file](https://github.com/hakluke/haktrails?tab=readme-ov-file#config-file) containing your [SecurityTrails API key](https://securitytrails.com/corp/api).

It will give error that `Only business email addresses are allowed`, but you can simply use the temp mail and it will work.

### subfinder

`subfinder` can be used immediately after installation, but many sources require API keys to work. To maximize output, you should register for API keys; many providers offer a free version with certain limitations.

Reference: https://docs.projectdiscovery.io/tools/subfinder/install#post-install-configuration

### notify

To send the results using the `notify` tool, we must add the webhooks to the config file. You can find an example config file [here](https://github.com/projectdiscovery/notify?tab=readme-ov-file#provider-config).

## Gathering existing subdomains

Before running the automation, make sure to first gather the existing subdomains and save them to a file. This way, when you run the final script, you will only receive notifications for any newly discovered domains. If you skip this step, you will be flooded with notifications for hundreds or thousands of subdomains. \
Here's the command you can run to gather the existing subdomains.

```
subfinder -d target.com -silent -nc -all | tee all-subdomains.txt
```

## Receive notifications

To receive notifications for the newly discovered subdomain, we can use the following simple script. \
For Linux, here is the bash script.

```bash
#!/bin/bash

domain="target.com"
file_name="path/to/all-subdomains.txt"
subfinder -d $domain -silent -nc -all | tr '[:upper:]' '[:lower:]' | anew $file_name | notify -bulk -silent -provider discord
echo $domain | haktrails subdomains | tr '[:upper:]' '[:lower:]' | anew $file_name | notify -bulk -silent -provider discord
```

For Windows, here is the Powershell script.

```powershell
$domain = "target.com"
$file_name = "path\to\all-subdomains.txt"
subfinder -d $domain -silent -nc -all | ForEach-Object { $_.ToLower() } | anew $file_name | notify -bulk -silent -provider discord
echo $domain | haktrails subdomains | ForEach-Object { $_.ToLower() } | anew $file_name | notify -bulk -silent -provider discord
```

### Explanation

To find subdomains, use the commands `subfinder -d $domain -silent -nc -all` or `echo $domain | haktrails subdomains`. Then, use `tr '[:upper:]' '[:lower:]'` or `ForEach-Object { $_.ToLower() }` to convert the piped input to lowercase because domain names are case insensitive. This step is important as `anew` will treat different case text as different and we want to avoid duplicate results.

To append all new lines to a file that are not present in file, use the command `anew $file_name`.

Finally, to send the results to Discord, use the command `notify -bulk -silent -provider discord`. You can use any provider of your choice.

## Continuous Monitoring

Now that we have our script, we want to automatically run this script at certain intervals to continuously monitor the newly discovered subdomains. There are multiple ways to achieve this.

### Scheduled Task in windows

In Windows, you can create a scheduled task to automatically run a PowerShell script at specific times or intervals. \
You can use the following PowerShell command to create a scheduled task that will run every Sunday at midnight.
- Save the PowerShell script as `monitor.ps1`.

```powershell
$taskTrigger = New-ScheduledTaskTrigger -Weekly -At 12:00AM -DaysOfWeek Sunday
$Action = New-ScheduledTaskAction -Execute "C:\Program Files\PowerShell\7\pwsh.exe" -Argument "path\to\monitor.ps1"
Register-ScheduledTask -TaskName "Subdomain Monitoring" -Trigger $taskTrigger -Action $Action
```

### Setup cron Jobs in Linux

#### Basic Crontab Syntax

```
MIN HOUR DOM MON DOW CMD
```
- **MIN** for minutes (0 - 59). 
- **HOUR** for hours (0 - 23).
- **DOM** for day of the month (1 - 31).
- **MON** for month (1 - 12 or JAN - DEC).
- **DOW** for day of the week (0 - 7 or SUN - SAT).
- **CMD** command.

Examples:
- Every Minute	
    - `* * * * * /path/to/script`
- Every Day at Midnight	
    - `0 0 * * * /path/to/script`
- Every 1st of the Month
    - `0 0 1 * * /path/to/script`
- Every Sunday at Midnight	
    - `0 0 * * 7 /path/to/script`
- Every Weekday at 4 AM	
    - `0 4 * * 1-5 /path/to/script`
- At 4 AM on Tuesdays and Thursdays	
    - `0 4 * * 2,4 /path/to/script`
- Every 20 Minutes - Multiple Scripts
    - `*/20 * * * * /path/to/script1; /path/to/script2`

#### Cron job syntax

Crontabs use the following flags for adding and listing cron jobs.
- `crontab -e`
    - edits crontab entries to add, delete, or edit cron jobs.
- `crontab -l`
    - list all the cron jobs for the current user.


Reference:
- https://www.freecodecamp.org/news/cron-jobs-in-linux/
- https://phoenixnap.com/kb/set-up-cron-job-linux


### Loops

You can also use an infinite loop with a `sleep` command to run the script at specific intervals.

Bash:
```bash
while :
do
    ./monitor.sh # Your script logic here
    sleep 3600   # Wait for 1 hour
done
```

PowerShell:
```powershell
while ($true) {
    # Your script logic here
    Start-Sleep -Seconds (4 * 24 * 60 * 60)  # Wait for 4 days
}
```

<br>

Thank you for reading this far. Happy hacking!