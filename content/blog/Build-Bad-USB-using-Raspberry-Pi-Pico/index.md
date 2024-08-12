---
title: "Build a Bad USB Device using Raspberry Pi Pico"
description: "Use the Raspberry Pi Pico as a bad USB (badusb) device."
summary: "Use the Raspberry Pi Pico as a bad USB (badusb) device."
date: 2024-08-10
draft: false
author: "Aftab Sama" # ["Me", "You"] # multiple authors
tags: ["Bad USB", "Raspberry Pi"]
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

## What is Bad USB?

When we connect a USB device to the computer, it sends a descriptor containing information such as its type, manufacturer, and product ID. Using this information, the operating system loads the appropriate driver for the device.

However, many common USB flash drives are vulnerable to "BadUSB," which allows hackers to reprogram the device's microcontroller to act as a human interface device (HID). This means it can mimic a keyboard and execute customized keystrokes on the target machine.

## Build a Bad USB Device

### Requirements

We will be using a Raspberry Pi Pico W microcontroller. Raspberry Pi Pico also works.

### Installing pico-ducky

To use the Raspberry Pi Pico as a bad USB device, we need to program it to act as an HID (Human Interface Device) device.

A good number of people have already done it. We will be using the [Pico-Ducky](https://github.com/dbisu/pico-ducky) GitHub repo.

> "If I have seen further it is by standing on the shoulders of Giants."
— Isaac Newton

Download the [pico-ducky-v2.0-us.zip](https://github.com/dbisu/pico-ducky/releases/download/v2.0/pico-ducky-v2.0-us.zip) preconfigured file from the GItHub repo.

Unzip the file; there will be two `.uf2` circuitpython files.
- adafruit-circuitpython-raspberry_pi_pico-en_US-8.0.0.uf2
- adafruit-circuitpython-raspberry_pi_pico_w-en_US-8.0.0.uf2

Press and hold the boot button on the Raspberry Pi Pico and connect it to the computer.

It will show up as a removable media device named `RPI-RP2`.
Copy the circuitpython file to the root of the Pico (RPI-RP2).
If you are using Pico W board then copy the `adafruit-circuitpython-raspberry_pi_pico_w-en_US-8.0.0.uf2` and if you are using Pico board copy `adafruit-circuitpython-raspberry_pi_pico-en_US-8.0.0.uf2`.

The device will reboot, and it will reconnect as `CIRCUITPY`.

Copy the `lib` folder and all the `*.py` files to the root of the `CIRCUITPY`.

Edit the payload.dd file with the [Rubber Ducky Payload](https://github.com/hak5/usbrubberducky-payloads) that you want to execute.

For testing, you can use the following payload:
```
REM Open Notepad in Windows and type "Hello World!"
REM
DELAY 2000
GUI r
DELAY 1000
STRING notepad
DELAY 500
ENTER
DELAY 2000
STRING Hello World!
```
Copy the `payload.dd` file to the root of the `CIRCUITPY`.

If you are using the Pico W board, edit the `secrets.py` file to change the name and password for the wifi access point to run the payload using wifi.

Unplug the USB device and reconnect to run the Rubber Ducky payload.

## Demo Video

<iframe width="560" height="315" src="https://www.youtube.com/embed/Mskv-wwqtX0?rel=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Troubleshoot

### USB enable/disable mode

To enable or disable the Pico from showing as a USB mass storage device, connect pin 18 (`GND`) and pin 20 (`GPIO15`).

![USB enable or disable mode](images/USB-enable-or-disable-mode.png#center)

### Setup mode

To edit the payload, enter setup mode by connecting pin 1 (`GP0`) to pin 3 (`GND`).
This will stop it from injecting the payload into your own machine.

![setup mode](images/setup-mode.png#center)

### Debugging

If you are facing any errors and want to debug, connect to the Raspberry Pi Pico board using a serial connection type. Use tools such as PyTTY.

In PuTTY, connect to the correct `COM` port using a serial connection type.

![PuTTY serial port connection](images/PuTTY-connect-Pico-board.png#center)

## References
- https://github.com/dbisu/pico-ducky
- [Buy Raspberry Pi Pico](https://www.raspberrypi.com/products/raspberry-pi-pico/#:~:text=Buy%20Raspberry%20Pi%20Pico%20series)

<br>
Happy Hacking