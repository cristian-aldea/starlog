---
title: "The best operating system for programming"
summary: "A comparison of the most popular operating systems, to help you find the best one for you."
date: 2021-12-04
lastmod: 2022-04-21
tags: ["programming", "windows", "linux", "wsl", "macOS"]
categories: []
---

Programming is hard work. Having the right operating system (OS) can lead to less hassle, and less time wasted on troubleshooting problems.

I have used Windows, Linux and macOS extensively for both programming and day-to-day use. Although you can develop software on any platform, each has its pros and cons. In this article, I'll outline these differences, and help you find the right fit for you.

What I write here is based on my experience, and some things might not apply to you. Feel free to use my advice to inform your decision, and pick whatever feels right.

## Windows

Windows is the OS I'm most familiar with. I've used it for years, all the way back from Windows XP. It's currently the most popular desktop OS, and supports a wide variety of hardware configurations.

However, I don't like programming on Windows. Unless you want to program games, or you only want to develop Windows apps, you are better off choosing something else.

### Not Unix

Most of the public server infrastructure in the world runs on Unix. This includes everything from the servers hosting the most popular websites, to the biggest supercomputers in the world. This makes Unix, which Linux and macOS are based on, a very important platform to learn, especially for web developers. Windows, on the other hand, is based on DOS. This means that Windows is fundamentally different from Linux or macOS, especially for software development.

One big difference between Windows and Unix is the **shell**. A shell is a command-line interpreter (CLI); it's a way for you to talk to a computer by writing text. It's a vital tool for many professional developers. Popular Unix shells like `bash` and `zsh` are industry standard, and are used in many companies and projects. Learning Unix can be very valuable for your career.

Windows, on the other hand, doesn't offer a Unix shell. Instead, it has the **Command Prompt** program, and the newer **Powershell**. They get the job done, but are very different from Unix shells, and don't see much use outside of Windows.

### Installing software is messy

As of publishing this article, installing software on Windows has always been an annoying process for me.

Want Python? go to their website, download an installer, run it, and then follow a bunch of steps to complete the installation.

Want NodeJS, MySQL or Java? Download another installer, and follow different steps to get the software installed.

Careful when going through those steps! The installer might not set up your [PATH](<https://en.wikipedia.org/wiki/PATH_(variable)>) correctly, and now you can't run your program since the system doesn't know where it was installed.

On Linux and macOS, installing software is often much simpler.

On Linux, a "package manager" is often included. It's a handy program to install software from official sources by writing a command, or pressing a button. For example, on [Debian](https://en.wikipedia.org/wiki/Debian) systems, you can use `apt`:

```bash
apt install python
```

Now you have python installed. Do you want to install anything else? It's all one step away.

On macOS, no package manager is available out of the box. However, [Brew](https://brew.sh) is a popular third-party offering. Although slow, it's reliable and simple to use:

```bash
brew install python
```

There are third-party package managers for Windows, like [Chocolatey](https://chocolatey.org). However, I can't recommend Chocolatey. From briefly trying it, `choco` doesn't feel as refined or easy to use as `brew` or `apt`, since it is maintained by a much smaller community.

UPDATE: Windows has improved massively in this area in the last few years. As of writing this, [winget-cli](https://github.com/microsoft/winget-cli) is offered as the official package manager for Windows. Check it out if you're interested.

## Linux

I think Linux is one of the best platforms for learning to code as of writing this article.

Popular products like MySQL, MongoDB, Java, NodeJS, C++, Docker, Kubernetes, Apache Server, Nginx, Ruby, etc. all have Linux as their main platform. if there's a server running important software, that software is probably running on Linux. This makes it the ideal OS for learning to code, since learning Linux will help you when you will be deploying professional applications to your clients.

Linux is typically faster than Windows, since it has a lower overhead. It's also free and open-source, making it easy for anyone to get a copy of Linux and get started.

However, despite Linux being used a lot for servers, it's a poor choice for a personal computer. The community using Linux as their main OS is very small and fragmented, and software support for basic things (Adobe, Microsoft Office, OneDrive, video games, etc.) can be lacking.

Also, most personal computers either have Windows or macOS installed. Using Linux on your computer will probably require you to install it yourself, which isn't something most people should have to do to use a computer.

[Linus Tech Tips](https://www.youtube.com/channel/UCXuqSBlHAE6Xw-yeJA0Tunw) made a very entertaining series detailing their journey of trying to use Linux on their main computer. Watch the first episode linked below:

{{< youtube 0506yDSgU7M >}}

### Running Linux alongside another OS

Despite the issues with running Linux, it can still be worth playing around with. An easy way to try it is to install it alongside another OS. This way, you get to learn to use Linux, and still have access to something more usable.

#### Virtual Machine

An easy way to try Linux is to run it on a virtual machine (VM). This allows you to try Linux in its own isolated space, without affecting your current machine in any way. You can then safely remove the VM if you don't need it anymore.

However, VMs are slow, and force you to split resources between your host and your VM. It's not the best long-term solution.

#### Windows Subsystem for Linux (WSL)

This option, exclusive to Windows, allows you to install Linux and run it alongside Windows. WSL has good integration with many popular tools ([VSCode](https://code.visualstudio.com/), [Jetbrains IDEs](https://www.jetbrains.com/products/#type=ide), etc...), and can be removed if you don't need it anymore, just like with a VM.

I think this is a great option for web development and any application development that isn't graphical. It makes Windows a powerful option for developers.

However, WSL runs Linux in a way that I'd describe as "headless". There is no Linux "GUI" you can access to run your Linux programs. The only way you can talk with the Linux subsystem is through a CLI, through networking, or through the file system. This makes things like OpenGL or game development impractical (or impossible) on WSL.

See the [official documentation](https://docs.microsoft.com/en-us/windows/wsl/install) if you're using Windows and want to get started with WSL.

Also, see this video by [Fireship](https://www.youtube.com/channel/UCsBjURrPoezykLs9EqgamOA) for a nice summary of what WSL can offer:

{{< youtube -atblwgc63E >}}

#### Dual Boot

With Dual Boot, you install two or more operating systems on separate parts of your computer's storage, and you can boot into either of them. You can then run multiple operating systems on one machine.

This gives you the most uncompromised way to run Linux alongside another OS, without virtualization or splitting resources.

However, you are splitting your storage into two (or more) pieces. I would not recommend doing this unless you know what you are doing, and I won't be linking any guides to this. You should do your own research. Dual-booting can be dangerous, and you could lose all of your files (make a backup!). Also, an operating system usually doesn't expect itself to be running in dual-boot. When I was dual-booting Windows and Linux, I wasted countless hours running into issues that required me to tinker and waste time maintaining my system.

## macOS

If you want good quality and minimal hassle, Apple products are a good option.

macOS is stable, very fast, Unix-based, and requires minimal tinkering to get started. This is because Apple controls every aspect of the machine (hardware, os, software), and can ensure a level of quality that would otherwise be impossible. It's also the only OS where you can develop software for Apple devices, like iOS and Mac. These are big platforms that you shouldn't ignore when you're trying to launch a product.

However, for all these perks, you pay a price. Apple devices are **expensive**. A Mac will cost you much more than a Windows or Linux machine with equivalent power. Also, Apple products tend to be locked down and hard to repair or upgrade, which is something that matters to many people.

## Summary

Here is a summary of the pros and cons of each OS according to my experience, for easy reference.

Since no option is perfect, I'd recommend trying them all and having access to as many of them as you can. Having access to all three operating systems means you can leverage all of their strengths, and avoid all their weaknesses.

I hope you've enjoyed reading this, and that you'll find my tips useful in finding the right OS for you :)

### Windows

- **Pros**
  - the most popular desktop OS
  - if using WSL, Windows is a very powerful option for web development and non-graphical app development
  - a very good option for developing games or Windows apps
- **Cons**
  - not Unix-based
  - installing software can be a pain
  - slower than Linux

### Linux

- **Pros**
  - Unix-based
  - most developer software is made to run on Linux servers
  - a great platform to learn and tinker in
  - can easily be installed alongside other operating systems
  - free (and open-source 👀)
- **Cons**
  - Poor user experience on personal computers
  - requires a lot more tinkering than other options to get things working

### macOS

- **Pros**
  - Unix-based
  - very stable and fast OS
  - minimal hassle and tinkering, things often work out of the box
- **Cons**
  - Apple machines are expensive 💸
  - Appl machines tend to be hard to repair and upgrade
  - no native package manager, you need to install something like Brew

## My Current Setup

You might be curious to know what my current setup is. It's subject to change, but here's what I'm currently using (since my last update to this article):

- I have a PC with Windows 11 and WSL, which has been working very well for web development
  - I avoid using Powershell or the Command Prompt if I can, and thankfully WSL lets me do that :D
- I use a MacBook for application development. Anything that has to do with native and graphical apps is a hassle in WSL, and Visual Studio is such a heavy app that I'd rather just use my MacBook.
