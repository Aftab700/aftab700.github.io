---
title: "Build a Hackable Router using ESP32"
description: "Use ESP32 to create a Wi-Fi network."
summary: "Use ESP32 to create a Wi-Fi network."
date: 2024-07-20
draft: false
author: "Aftab Sama" # ["Me", "You"] # multiple authors
tags: ["ESP32", "Wi-Fi", "IoT"]
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

## What is ESP32

The [ESP32](https://www.espressif.com/en/products/socs/esp32) is a flexible microcontroller chip that supports Wi-Fi and Bluetooth. It is commonly utilized in IoT (Internet of Things) projects because of its low cost, low power consumption, dual-core architecture, and wide range of networking possibilities.

## ESP32 NAT Router

### Usage scenarios

1. Expand the range of an existing Wi-Fi network.
2. Establish an additional Wi-Fi network with a different SSID or password for guests or IoT devices.
3. Create a Wi-Fi network to intercept and analyze network traffic, including login information.
4. Create Wi-Fi honeypots for security testing.

### Prerequisite

- ESP32 microcontroller chip
- Computer with Python installed
- [esptool](https://github.com/espressif/esptool)

After installing [Python](https://www.python.org/downloads/) on our machine, we can use `pip` to install the [esptools](https://docs.espressif.com/projects/esptool/en/latest/esp32/).

```
pip install esptool
```

#### Installing Drivers:

OS will attempt to install the necessary drivers for ESP32 automatically. If it fails, you can download `CP210x USB to UART Bridge VCP Drivers` from [here](https://www.silabs.com/developers/usb-to-uart-bridge-vcp-drivers?tab=downloads).

Once the drivers are installed, after connecting the esp32 to your computer, We should be able to see it in the `Device Manager` for Windows.

![ESP32 COM Port](image/image-1.png#center)

### Flashing ESP32

Download the prebuild binaries from [here](https://github.com/dchristl/esp32_nat_router_extended/releases/tag/v7.1.1).

After downloading the pre-built binary from GitHub, unzip it and open a terminal in that directory. Then, run the following command to flash the ESP32.

```bash
esptool write_flash 0x0 esp32nat_extended_full_v7.1.1.bin
```

<details><summary markdown="span">Click to see Example Output</summary>

```cmd
┌──PS(Jack@Sparrow)-[~\Downloads\esp32nat_extended_full_v7.1.1]
└─$ esptool write_flash 0x0 esp32nat_extended_full_v7.1.1.bin
esptool.py v4.7.0
Found 1 serial ports
Serial port COM3
Connecting.....
Detecting chip type... Unsupported detection protocol, switching and trying again...
Connecting.....
Detecting chip type... ESP32
Chip is ESP32-D0WD-V3 (revision v3.1)
Features: WiFi, BT, Dual Core, 240MHz, VRef calibration in efuse, Coding Scheme None
Crystal is 40MHz
MAC: cc:7b:5c:34:b6:08
Uploading stub...
Running stub...
Stub running...
Configuring flash size...
Flash will be erased from 0x00000000 to 0x00158fff...
Compressed 1413056 bytes to 788258...
Wrote 1413056 bytes (788258 compressed) at 0x00000000 in 72.8 seconds (effective 155.2 kbit/s)...
Hash of data verified.

Leaving...
Hard resetting via RTS pin...
```
</details>


### Setting up ESP32 NAT

After flashing the firmware into the ESP32, We should be able to see a wifi network named `ESP32_NAT_Router`.
![ESP32 Wi-Fi](image/image-2.png#center)

Connect to the `ESP32_NAT_Router` and visit the gateway IP in your browser.
![ESP32 Wi-Fi Gateway](image/image-3.png#center)

![ESP32 Nat Router Config Page](image/image-4.png#center)

We don't yet have an internet connection. To achieve this, we have to set up an uplink WiFi network.
To do that, we require an SSID and password. \
We have the option to manually enter the SSID or utilize the Wi-Fi Scan feature to search for available Wi-Fi networks and use them.

![SSID Scan](image/image-5.png#center)
![uplink Wi-Fi Settings](image/image-6.png#center)

Now the ESP32 is connected to the internet, and we can also modify the Wi-Fi's Mac address, SSID, and password.


## References

- https://github.com/dchristl/esp32_nat_router_extended
- https://www.youtube.com/watch?v=41Lymi6rXA8

<br>

Happy Hacking