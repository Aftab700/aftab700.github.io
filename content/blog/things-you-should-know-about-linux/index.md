---
title: "Things you should know about Linux"
description: "Things you should know about Linux, including its strange history and why there are so many different distributions."
summary: "Things you should know about Linux, including its strange history and why there are so many different distributions."
date: 2024-08-06
draft: false
tags: ["Linux", "Unix"]
---


## How Linux was created

### History of UNIX

The `UNIX` operating system was developed by `AT&T` Corporation’s Bell Laboratories in the late 1960s. In 1969, a team led by computer scientists Ken Thompson and Dennis Ritchie created the first version of UNIX.

The formal presentation of the Unix operating system to the outside world took place at the 1973 Symposium on Operating Systems Principles, where Ritchie and Thompson delivered a paper. This gained interest, but due to a [1956 consent decree](https://economics.yale.edu/sites/default/files/how_antitrust_enforcement.pdf) in settlement of an antitrust case, the Bell System (the parent organization of Bell Labs) was restricted from entering any business other than "common carrier communications services" and was obligated to license any patents it had upon request. As a result, UNIX could not be commercialized.

In 1983, the U.S. Department of Justice settled its second antitrust case against AT&T, leading to the breakup of the Bell System. This relieved AT&T of the 1956 consent decree and allowed the company to commercialize UNIX.

On another note, various `Unix-like` operating systems originated from the University of California, Berkeley's version of Unix, such as the one used today on Apple computers, known as OS X. They are termed "Unix-like" because the developers of the Berkeley Software Distribution (BSD) Unix worked to eliminate all the original AT&T code, ensuring that their software and its descendants could be freely distributed.

Legal issues arose when AT&T's Unix subsidiary sued `Berkeley Software Design, Inc.`(BSDi) for copyright infringement and other charges related to BSD; subsequently, the University of California countersued. The resulting legal complications delayed the development of free Unix-like clones, including `386BSD`, intended for the Intel 386 chip, which was commonly used in IBM PCs at that time.

The competition among vendors to establish a standard for the Unix operating system in the late 1980s and early 1990s was known as the `Unix wars`, which ultimately led to the development of `POSIX`.

![Unix genealogy tree](images/unix-genealogy-tree.webp#center)

### Portable Operating System Interface (POSIX)

**POSIX**, which stands for Portable Operating System Interface, comprises a set of standards defined by the IEEE Computer Society. These standards are aimed at ensuring compatibility among different operating systems.

POSIX encompasses both system and user-level application programming interfaces (APIs), as well as command-line shells and utility interfaces, to facilitate software compatibility (portability) with various Unix versions and other operating systems.

### GNU Project

In September 1983, Richard Stallman announced his intention to start coding the GNU Project in a `Usenet` message.

By June 1987, the project had accumulated and developed free software for an assembler, an almost finished portable optimizing C compiler (GCC), an editor (GNU Emacs), and various Unix utilities such as `ls`, `grep`, `awk`, `make`, `ld`, `tar`, and `bash`.

By 1992, the GNU project had completed all major operating system utilities but had not completed their proposed kernel, GNU Hurd.

### Linux

In April 1991, Linus Torvalds, a 21-year-old computer science student at the University of Helsinki, began working on an operating system inspired by UNIX for personal computers.

On 25 August 1991, Torvalds shared the following message on comp.os.minix, a newsgroup on Usenet:
```
Hello everybody out there using minix -

I'm doing a (free) operating system (just a hobby, won't be big and
professional like gnu) for 386(486) AT clones.  This has been brewing
since april, and is starting to get ready.  I'd like any feedback on
things people like/dislike in minix, as my OS resembles it somewhat
(same physical layout of the file-system (due to practical reasons)
among other things).

I've currently ported bash(1.08) and gcc(1.40), and things seem to work.
This implies that I'll get something practical within a few months, and
I'd like to know what features most people would want.  Any suggestions
are welcome, but I won't promise I'll implement them :-)

                Linus (torva[...](https://web.archive.org/web/20130509134305/http://groups.google.com/groups/unlock?_done=/group/comp.os.minix/msg/b813d52cbc5a044b&msg=b813d52cbc5a044b)@kruuna.helsinki.fi)

PS.  Yes - it's free of any minix code, and it has a multi-threaded fs.
It is NOT protable (uses 386 task switching etc), and it probably never
will support anything other than AT-harddisks, as that's all I have :-(.
```

Linus Torvalds originally wanted to name his invention `Freax` and stored the files under that name for about six months. However, he also considered the name `Linux` but initially thought it was too egotistical. In September 1991, the files were uploaded to the FTP server (ftp.funet.fi) of FUNET to facilitate development.

Ari Lemmke at Helsinki University of Technology (HUT), who was one of the volunteer administrators for the FTP server, didn't like the name `Freax` and decided to name the project `Linux` on the server without consulting Torvalds. Torvalds later agreed to the name `Linux`.

### GNU/Linux

Torvalds first published the Linux kernel under its own license which had a restriction on commercial activity.

In 1992, he published version 0.99 using the GNU General Public License (GPL). Subsequently, Linux and GNU developers collaborated to integrate GNU components with Linux, creating a fully functional and free operating system.

A stable version (or variant) of GNU can be run by combining the GNU packages with the Linux kernel, making a functional Unix-like system. The GNU project calls this GNU/Linux.


## Linux distributions (Distros)

### What is the Linux distribution (Distro)?

A Linux distribution is an operating system that includes the Linux kernel, along with a package management system.

The typical components of a Linux distribution are the Linux kernel, an init system (such as `systemd`, `OpenRC`, or `runit`), GNU tools, and libraries. In addition, to provide a desktop interface, a Linux distribution might include a display server, a desktop environment (such as [GNOME](http://www.gnome.org/), [MATE](https://mate-desktop.com/), KDE Plasma, Cinnamon, or [Xfce](https://xfce.org/)), and other related software.

Each distribution is tailored to meet different user needs, such as ease of use, performance, or specific applications. They are designed to serve different purposes. Some are created for enterprise users, while others are intended for home users. \
Some are meant to run only on specific systems, such as embedded devices, mobile devices, personal computers, servers, and powerful supercomputers.

### Slackware

[Slackware](http://www.slackware.com/) is a Linux distribution created by Patrick Volkerding in 1993. Initially based on the Softlanding Linux System, Slackware has served as the foundation for numerous other Linux distributions, particularly the early versions of SUSE Linux. It holds the distinction of being the oldest maintained distribution.

### Debian

[Debian](https://www.debian.org/), also known as Debian GNU/Linux, is a Linux distribution established by Ian Murdock on August 16, 1993.

The word "Debian" comes from the first name of his then-girlfriend (later ex-wife) Debra Lynn and his own first name.

The first version of Debian (0.01) was released on September 15, 1993, and its first stable version (1.1 Buzz) was released on June 17, 1996.

Debian distribution codenames are based on the names of characters from the Toy Story films.  The Debian Stable branch is the most popular edition for personal computers and servers. Known for its stability and extensive software repository.

Debian is also the foundation for many other distributions that serve different purposes, such as [Proxmox](https://www.proxmox.com/en/) for servers, [Ubuntu](https://ubuntu.com/) or [Linux Mint]([Linux Mint: Home Linux Mint https://linuxmint.com](https://linuxmint.com/)) for desktops, [Kali](https://www.kali.org/) for penetration testing, and [Pardus](https://www.pardus.org.tr/en/about/) and [Astra](https://astralinux.ru/) for government use.

#### Advanced package tool (APT)

The "apt-get" program was the replacement project for "dselect" known by its codename Deity. The first Debian version to include it was Debian 2.1, released on 9 March 1999.

### Ubuntu

[Ubuntu](https://ubuntu.com/) is a Linux distribution based on Debian, consisting mostly of free and open-source software. It is officially available in multiple editions: desktop, server, and core for Internet of Things devices and robots. It is known for its user-friendliness and large community support.
It was first released in October 2004 and is managed by a British company based in London, [Canonical Ltd.](https://canonical.com/)

Ubuntu releases new versions every six months, with Long-Term Support (LTS) versions every two years that receive five years of support and updates.


### Redhat

Founded in 1993, [Red Hat, Inc.](https://www.redhat.com/) is an American software company that provides open-source software products to enterprises. IBM acquired Red Hat for US$34 billion in 2019.
It's known for focusing on security, performance, and reliability.

Red Hat primarily uses a subscription-based business model. It generates revenue through subscriptions that provide access to RHEL, consulting services, training and certification.

Its popular descendants include RHEL, [Fedora](https://fedoraproject.org/), and [CentOS](https://www.centos.org/).

### Arch & Gentoo

[Gentoo Linux](https://www.gentoo.org/) was officially released on March 31, 2002. It is known for its source-based package management system, Portage, which allows users to compile software tailored to their specific hardware and preferences.

[Arch Linux](https://archlinux.org/) had its first formal release on March 11, 2002. Arch is known for its simplicity, minimalism, and rolling release model, which ensures users always have access to the latest software updates. It uses a package manager called Pacman.

Both distributions cater to advanced users who prefer a high degree of customization and control over their systems. Arch is also the parent of [Manjaro Linux](https://manjaro.org/).

### Android

[Android](https://www.android.com/) is an operating system that is based on the Linux kernel, but it differs from traditional Linux distributions such as Ubuntu or Fedora. Unlike traditional Linux distributions, Android does not include GNU software like the GNU C Library; instead, it uses its own C library called Bionic, along with custom components. In addition, Android uses the Android Runtime (ART) for running applications, which is not part of the standard Linux runtime environments.

There are custom versions of Android known as custom ROMs, which offer extra features and customization options. Some popular custom Android distributions include [LineageOS](https://lineageos.org/), [Paranoid Android](https://paranoidandroid.co/), and [GrapheneOS](https://grapheneos.org/).

## Kernel

The Linux kernel is the core component of the Linux operating system and it is written in C Programming language. It acts as a bridge between the hardware of a computer and its software applications.

![An oversimplification of how a kernel connects application software to the hardware of a computer](images/kernel-image.webp#center)

When you press the power button on a computer, several steps occur to start the system:
1. **Power On**: The power supply turns on and sends a “Power Good” signal to the CPU.
2. **BIOS/UEFI Initialization**: The CPU runs the BIOS (Basic Input/Output System) or UEFI (Unified Extensible Firmware Interface), which initializes hardware components and performs a Power-On Self Test (POST).
3. **Bootloader Loading**: The BIOS/UEFI loads the bootloader from the Master Boot Record (MBR) or GUID Partition Table (GPT) into RAM.
4. **Kernel Loading**: The bootloader loads the operating system kernel into memory and hands over control to it.
5. **Kernel Initialization**: The kernel initializes system components, loads drivers, and mounts the root filesystem.
6. **System Services Start**: The kernel starts essential system services and daemons.
7. **User Interface Launch**: The kernel will initiate applications in user space, launching a graphical user interface (GUI) or command-line interface (CLI).

Here are some key aspects of the Linux kernel:

- **Resource Management**: The kernel manages system resources such as CPU, memory, and I/O devices, ensuring efficient and fair allocation to various processes.
- **Hardware Abstraction**: It provides a layer of abstraction between the hardware and software, allowing applications to interact with hardware without needing to know the specifics of the hardware.
- **Security**: The kernel includes various security features to protect the system from unauthorized access and ensure data integrity.
- **Modularity**: The Linux kernel is modular, meaning it can dynamically load and unload modules (drivers) as needed, allowing for flexibility and extensibility.

### System calls

System calls (syscalls) are the fundamental interface between an application and the Linux kernel. They allow user-space programs to request services and resources from the kernel, such as file operations, process management, and network communication.

![Linux System Call interface](images/linux-system-call-interface.webp#center)

## Shell

A shell is a computer program that provides an interface between the user and the operating system. It allows users to interact with the system by entering commands, which the shell interprets and passes on to the operating system to execute.

Popular flavors of Shell:

- **[Bash](https://www.gnu.org/software/bash/) (Bourne Again Shell)**: One of the most widely used shells in Unix-like systems. It offers powerful scripting capabilities and is the default shell in many Linux distributions.
- **[Zsh](https://www.zsh.org/) (Z Shell)**: Known for its advanced features and customization options, making it popular among power users.
- **[Fish](https://fishshell.com/) (Friendly Interactive Shell)**: Focuses on user-friendliness and includes features like syntax highlighting and autosuggestions.

## Linux file system

### Hierarchical Structure

The Linux file system is organized in a hierarchical tree-like structure, starting from the root directory (`/`). All other directories and files are contained within this root directory. Some of the key directories include:

- **`/bin`**: Contains essential user binaries (e.g., `ls`, `cp`, `mv`).
- **`/sbin`**: Contains System binary files.
- **`/boot`**: Contains boot loader files, including the kernel.
- **`/dev`**: Contains device files that represent hardware devices.
- **`/etc`**: Contains system configuration files.
- **`/home`**: Contains user home directories.
- **`/lib`**: Contains essential shared libraries.
- **`/media`**: Used for mounting removable media.
- **`/mnt`**: Used for temporarily mounting filesystems
- **`/root`**: Home directory for the root user.
- **`/tmp`**: Temporary directory. Used to store temporary files.
- **`/usr`**: These are shareable, read-only files.
- **`/var`**: Variable data files are stored here. This can include things like log files.

### Layers of the Linux File System

1. **Logical File System**: Acts as the interface between user applications and the file system, managing operations like opening, reading, and closing files.
2. **Virtual File System (VFS)**: Provides a standardized interface for multiple physical file systems, allowing them to coexist and operate simultaneously.
3. **Physical File System**: Manages the actual storage of data on the disk, handling low-level details of data allocation and retrieval

### Common File Systems

- **ext4**: The most widely used file system in Linux, known for its stability and performance.
- **Btrfs**: Designed for high performance and advanced features like snapshotting and self-healing.
- **XFS**: Known for its scalability and high performance, especially with large files.
- **ZFS**: Offers advanced features like data integrity verification and high storage capacity

### File Permissions and Ownership

Linux uses a permission and ownership model to control access to files and directories. Each file and directory has:

- **Owner**: The user who owns the file.
- **Group**: A group of users who have specific permissions.
- **Permissions**: Read, write, and execute permissions for the owner, group, and others.
![File Permissions](images/file-permissions.webp#center)
### Mounting and Unmounting

- **Mounting**: The process of making a file system accessible at a certain point in the directory tree.
- **Unmounting**: The process of detaching a file system from the directory tree.

## Input/Output Redirection

Input and output in the Linux environment are distributed across three streams, which are also numbered: standard input (`stdin`) (`0`), standard output (`stdout`) (`1`), and standard error (`stderr`) (`2`).
During standard interactions between the user and the terminal, input is received from the user's keyboard, while output and errors are displayed as text on the user's terminal.

### Stream Redirection

In Linux, there are redirection commands for each stream. These commands can be used to write standard output or standard error to a file. If you write to a file that does not exist, a new file with that name will be created before writing.

#### Overwrite
Commands with a single bracket overwrite the destination's existing contents:
- `>`: standard output
- `<`: standard input
- `2>`: Standard error
![Standard I/O Overwrite](images/standard-i-o-overwrite.webp#center)

#### Append
Commands with a double bracket do not overwrite the destination's existing contents; instead, they append to it:
- `>>`: standard output
- `<<`: standard input
- `2>>`: standard error

![Standard I/O Append](images/standard-i-o-append.webp#center)

### Pipes

Pipes are used to redirect the output of one command to another command. When a command's standard output is sent to another through a pipe, the first command’s output will be used as input for the second command rather than being printed on the terminal. Only the data returned by the second command will be displayed.

The Linux pipe is represented by a vertical bar `|`.
![Pipe command output](images/pipe-command-output.webp#center)

## Bash Script

A Bash script is a file containing a series of commands written in the Bash (Bourne Again Shell) scripting language. Bash is a command processor that typically runs in a text window where the user types commands that cause actions. A Bash script allows you to automate tasks by writing these commands in a file and executing them as a program.

### Shebang

A shebang (also known as a hashbang or sha-bang) is the character sequence `#!` at the very beginning of a script file in Unix-like operating systems. It specifies the interpreter that should be used to execute the script.

When you run a script, the operating system uses the shebang line to determine which interpreter to use. For example, if your script starts with `#!/bin/bash`, the system will use the Bash shell to execute the script.\
Example:
```bash
#!/bin/bash
echo "Hello, World!"
```

### variables

We can define a variable by using the syntax `variable_name=value`. To access the value of the variable, use `$` followed by the variable name.
```
#!/bin/bash
name="Aftab"  # A simple variable example
echo "Hello $name"
```
![Bash Variable Image](images/variables-bash-1.webp#center)

#### Linux Commands

**`echo`**: Takes the message as an argument and prints it to the standard output.

**`read`**: Reads the input and assigns it to the variable.

**`whoami`**: returns the current user’s username.

**`su`**: substitute or switch user, execute commands with the privileges of another user, typically root.

**`sudo`**: Super User Do, let's user run the command as root..

**`mkdir`**: Make a new directory.

**`cd`**: change directory.

**`pwd`**: Print the current working directory.

**`ls`**: List files and directories.

**`export`**: Set the value for the environment variable.

**`chown`**: change file ownership.

**`ps`**: process status, get information about the currently running processes.

**`htop`**: monitor system processes in real-time.

**`crontab`**: view or edit [cron jobs](https://man7.org/linux/man-pages/man8/cron.8.html).

**`kill`**: terminate processes manually.

**`grep`**: search text patterns within files.

**`sed`**: stream editor, used to edit text files, with its most common use being to replace occurrences of words in a files.


## References

- https://en.wikipedia.org/wiki/Unix
- https://en.wikipedia.org/wiki/Unix-like
- https://spectrum.ieee.org/the-strange-birth-and-long-life-of-unix
- https://en.wikipedia.org/wiki/Linux_kernel
- https://en.wikipedia.org/wiki/Kernel_(operating_system)
- https://en.wikipedia.org/wiki/History_of_Unix
- https://www.youtube.com/watch?v=ShcR4Zfc6Dw
- https://www.youtube.com/watch?v=LKCVKw9CzFo
- https://www.digitalocean.com/community/tutorials/an-introduction-to-linux-i-o-redirection
- https://www.freecodecamp.org/news/shell-scripting-crash-course-how-to-write-bash-scripts-in-linux/

---
