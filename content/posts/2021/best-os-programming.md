---
title: "The best operating system for programming"
summary: "A comparison of the most popular operating systems, to help you find the best one for you."
date: 2021-12-04
lastmod: 2022-03-17
tags: ["windows", "linux", "wsl", "macOS"]
categories: ["programming"]
---

Programming is challenging work. Having the right operating system (OS) can lead to less hassle, and less time wasted on troubleshooting problems.

I have used Windows, Linux and macOS extensively for both programming and day-to-day use. Although you can develop software on all of them just fine, each has its pros and cons. In this article, I'll outline these differences, and help you find the right fit for you.

What I write here is based on my experience, and some things might not apply to you. Feel free to use my advice to inform your decision, and pick whatever feels right.

## Windows

Windows is an OS I've used for many years, all the way back from Windows XP. It's currently the most popular desktop OS, and is amazing considering how many kinds of devices it supports.

However, I don't like programming on Windows. Unless you want to program games, [UWP apps](https://docs.microsoft.com/en-us/windows/uwp/get-started/universal-application-platform-guide) or you only want to develop your application for the Windows platform, you are better off choosing something else in my opinion.

Why? The sections below will detail my reasoning.

### Not Unix

Nearly all of the server infrastructure in the world runs on Linux. This includes everything from the servers hosting the most popular websites, to the biggest supercomputers in the world. This makes Unix, which Linux and macOS are based on, a very important platform to learn, especially for web developers. Windows, on the other hand, is based on DOS. This means that Windows is fundamentally different from Linux or macOS, especially for programming.

One big difference between Windows and Unix is the **shell**. A shell is a command-line interpreter (CLI), which is a program that allows you to type text commands. It's a vital tool for many developers, since it simplifies many developer tasks, like talking to a server, automation, running programs, and so on. Popular Unix shells like `bash` and `zsh` are industry standard, and used in many companies and projects. Learning Unix can be very valuable for your career.

Windows, on the other hand, doesn't offer a Unix shell. Instead, it has the **Command Prompt** program, and the newer **Powershell**. They get the job done, but are very different from Unix shells, and aren't used much outside of Windows.

### No package manager

As of publishing this article, Windows has no native package manager, and no consistent way to get the software you need for software development.

Want Python? go to their website, download an installer, run it, and then follow the (many) steps to complete the installation.

Want NodeJS, MySQL or Java? Download another installer, and follow different steps to get the software installed.

Installing software on Windows is tedious and inconsistent. The installer might not set up your [PATH](<https://en.wikipedia.org/wiki/PATH_(variable)>) correctly, and now you can't run your program since the system can't find where it was installed.

On Linux, a "package manager" is often included. It's a handy program to install popular software from official sources through a CLI or GUI. For example, on [Debian](https://en.wikipedia.org/wiki/Debian) systems, you can use `apt`:

```bash
apt install python
```

Now you have python installed. Do you want to install anything else? It's all one click or one command away.

On macOS, no package manager is available out of the box. However, [Brew](https://brew.sh) is a popular and high-quality package manager available for macOS. Although slow, is a high-quality offering, and installing software with it is a breeze:

```bash
brew install python
```

Third-party package managers for Windows, like [Chocolatey](https://chocolatey.org), have also existed for a long time. However, I can't recommend them, since they are managed by a much smaller community than Brew, and quality control can be lacking.

UPDATE: Windows has improved massively in this area in the last few years. As of writing this, [winget-cli](https://github.com/microsoft/winget-cli) is offered as the official package manager for Windows. Check it out if you're interested.

## Linux

I think Linux is the ideal platform for learning to code as of writing this article.

Popular products like MySQL, MongoDB, Java, NodeJS, C++, Docker, Kubernetes, Apache Server, Nginx, Ruby, etc. all have Linux as their main platform. if there's a server running important software, that software is probably run on Linux. This makes it the ideal OS for learning to code, since learning Linux will help you when you will be deploying professional applications to your clients.

Linux is fast. It has very little overhead and uses very little CPU and memory compared to Windows. It's also free and open-source, making it easy for anyone to get a copy of Linux, or to have a look at the source code.

Despite Linux being used almost universally for servers, it's a poor choice for a personal computer. The community using Linux like this is very small and fragmented, and software support for basic things (Adobe, Microsoft Office, OneDrive, video games, etc.) can be lacking, since Linux isn't very popular as an OS for personal computers.

Also, most personal computers either have Windows or macOS installed. Using Linux on your computer will probably require you to install it yourself, which isn't something most people should have to do to use a computer.

### Running Linux alongside another OS

Despite the issues with running Linux for desktop/laptop, it can still be worth playing around with. An easy way to try it is to install it alongside another OS. This way, you get to learn Linux, and still have access to something friendlier.

#### Virtual Machine

An easy way to try Linux is to run it in a virtual machine (VM). This allows you to try Linux in its own isolated space, without affecting your current machine in any way. You can then safely remove the VM if you don't need it anymore.

However, VMs are slow, and force you to split resources between your host and your VM.

#### Windows Subsystem for Linux (WSL)

This option, exclusive to Windows, allows you to install Linux and run it alongside Windows. WSL has good integration with many popular tools, and can easily be removed if you don't need it anymore, just like with a VM.

I think this is a great option for things like web development and non-GUI application development. It's very useful and makes Windows a powerful option for developers.

However, WSL runs Linux in a way that I'd describe as "headless". There is no Linux "GUI" you can access to run your Linux programs, and the only way you can talk with WSL is through a CLI, through networking, or the file system. This makes things like OpenGL or game development impossible or impractical on WSL.

See the [official documentation](https://docs.microsoft.com/en-us/windows/wsl/install) if you're using Windows and want to get started with WSL.

#### Dual Boot

With Dual Boot, you install two or more operating systems on separate parts of your computer's storage, and you can boot into either of them. You can then run multiple operating systems on one machine.

This gives you the most uncompromised way to run Linux alongside another OS, without virtualization or splitting resources.

However, I would not recommend doing this unless you know what you are doing. Dual-booting can be dangerous, and you could lose all of your files (make a backup!). Also, dual-booting isn't well supported by Windows, and you will run into issues that require you to tinker and waste time maintaining your system.

## macOS

If you want good quality and minimal hassle, Apple products are a good option.

macOS is stable, fast, Unix-based, and requires minimal tinkering to get started. This is because Apple controls every aspect of the machine (hardware, os, software), and can ensure a level of quality that would otherwise be impossible. It's also the only OS where you can develop software for Apple devices, like iOS and Mac.

However, for all these perks, you pay a price. Apple devices are **expensive**. A Mac will cost you much more than a Windows or Linux machine with equivalent power.

Also, macOS isn't well suited for certain heavy workloads, like game development or machine learning, since Macbooks tend to be slim, stylish, and lack the raw power of other options.

## Summary

Here is a summary of the pros and cons of each OS, for easy reference.

Since no option is perfect, I'd recommend trying them all and having access to as many of them as you can. Having access to all three operating systems means you can leverage all of their strengths, and avoid all their weaknesses.

I hope you've enjoyed reading this, and that you'll find my tips useful in finding the right OS for you :)

### Windows

- **Pros**
  - Versatile, capable of running software on many different kinds of devices
  - WSL is an easy way to integrate Linux alongside your Windows computer
  - A very good option for game or UWP development
- **Cons**
  - Not Unix based, unlike Linux and macOS
  - slower than Linux

### Linux

- **Pros**
  - Almost all developer software is made to run well on Linux servers
  - A great platform to learn and tinker in
  - Can easily be installed alongside other operating systems
  - free (and open-source 👀)
- **Cons**
  - Poor user experience on personal computers, Linux is mainly popular as a server OS, not a personal computer OS
  - Might require a lot of tinkering to get things working

### macOS

- **Pros**
  - Very stable and fast OS
  - Unix-based, so learning macOS will help with learning Linux
  - Minimal hassle and tinkering, things often work out of the box
- **Cons**
  - Apple machines are expensive 💸
  - No native package manager, you need to install Brew or other similar software
  - Not well suited for heavy workloads
