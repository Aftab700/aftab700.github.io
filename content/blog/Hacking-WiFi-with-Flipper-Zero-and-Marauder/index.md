---
title: "Hacking WiFi with Flipper Zero and Marauder"
description: "Install Marauder firmware on ESP32 and use it with Flipper Zero to Hack WiFi."
summary: "Install Marauder firmware on ESP32 and use it with Flipper Zero to Hack WiFi."
date: 2024-07-21
draft: false
author: "Aftab Sama" # ["Me", "You"] # multiple authors
tags: ["ESP32", "WiFi", "IoT", "Flipper Zero"]
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

## Install Marauder firmware on ESP32

The [ESP32](https://www.espressif.com/en/products/socs/esp32) is a flexible microcontroller chip that supports WiFi and Bluetooth. It is commonly utilized in IoT (Internet of Things) projects because of its low cost, low power consumption, dual-core architecture, and wide range of networking possibilities.

[Marauder](https://github.com/justcallmekoko/ESP32Marauder) firmware is a suite of WiFi/Bluetooth offensive and defensive tools designed for use with the ESP32.

To install the Marauder firmware on the ESP32, there are multiple options available. As described in the GitHub repository by [justcallmekoko](https://github.com/justcallmekoko), We have the blue pill and red pill available, which you can check out [here](https://github.com/justcallmekoko/ESP32Marauder/wiki/flipper-zero#firmware-install-options).


### Flashing the Marauder firmware

For flashing Marauder firmware on the ESP32, we will use the [FZEasyMarauderFlash](https://github.com/SkeletonMan03/FZEasyMarauderFlash) Python script, which is the easiest option. You can follow the instructions in this [GitHub repo](https://github.com/SkeletonMan03/FZEasyMarauderFlash).

## Connecting ESP32 to Flipper Zero

For this example, I am using the [Momentum](https://github.com/Next-Flip/Momentum-Firmware) firmware in my Flipper Zero. \
Additionally, all the Flipper Zero related files can be found in [this](https://github.com/UberGuidoZ/Flipper) GitHub repository.

### GPIO pins connection

To connect the ESP32 to the Flipper Zero using GPIO pins, we will need four jumper wires that will be connected to the `3V3`, `GND`, `RX0`, and `TX0` GPIO pins.

It's important to note that the `RX` and `TX` labels are in reference to the device itself. Therefore, the `RX` from one device should be connected to the `TX` of the other, and vice versa.

| ESP32 |        | Flipper Zero |
| :---: | :----: | :---: |
| `3V3` | &rarr; | `3V3` |
| `GND` | &rarr; | `GND` |
| `RX0` | &rarr; | `TX` |
| `TX0` | &rarr; | `RX` |


## WiFi Attacks

WiFi attacks involve the active transmission of WiFi data from the ESP32 Marauder. WiFi packets are specially crafted to accomplish a specific transmission goal. The following attacks can be used by the ESP32 Marauder.

To access the Marauder in Flipper Zero goto: `Apps > GPIO > ESP > WiFi Marauder`.

### Rick Roll Beacon

In a Rick Roll Beacon attack, specially crafted beacon frames are transmitted. This causes the lyrics of "Never Gonna Give You Up" to display in the network lists of devices in range of the transmission.

<iframe width="560" height="315" src="https://www.youtube.com/embed/35KG0rjKFFI?rel=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

### Beacon Spam

In the beacon spam attack, the ESP32 broadcasts beacon frames for each SSID contained within its list of SSIDs. We can add SSIDs to the list, or we can generate random names.

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/zKtVT1SYAVQ?rel=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

### Sniff EAPOL/PMKID

Using Marauder, we can sniff the Wi-Fi packets and capture the four-way Wi-Fi handshakes. To do that, we will capture all the raw packets.

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/2aMRRhJw0Tk?rel=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>



## References

- https://github.com/justcallmekoko/ESP32Marauder
- https://github.com/SkeletonMan03/FZEasyMarauderFlash
- https://www.youtube.com/watch?v=subLBPJ3IxU


<br>

Thank you for reading this far. Happy hacking!