---
title: "The best operating system for programming"
summary: "A comparison of the most popular operating systems, to help you find the best one for you."
date: 2021-12-04T21:00:00-05:00
tags: ["windows", "linux", "wsl", "macOS"]
categories: ["programming"]
---

Programming is challenging work, and having the right operating system (OS) can be very helpful. If you're using the right environment for the job, it can lead to less hassle, and less time wasted on troubleshooting problems.

I have extensive experience using Windows, Linux and macOS for both programming and day-to-day use. Although you can develop software on all of them just fine, each has its pros and cons. In this article, I'll outline these differences, and help you find the right platform for you. I'll mainly focus on Windows, Linux and macOS, since they are by far the most popular platforms available for desktops and laptops.

What I write here is based on my experience, and some things might not apply to you. Feel free to use my advice to inform your decision, and pick whatever feels right.

## Windows

Windows is an OS I've used for many years, all the way back from Windows XP. It's currently the most popular desktop OS, and is amazing considering how many kinds of devices it supports.

However, I don't like programming on Windows. Unless you want to program games, [UWP](https://docs.microsoft.com/en-us/windows/uwp/get-started/universal-application-platform-guide) apps or you specifically want to write for Windows, you are better off choosing something else in my opinion.

Why, you may ask? The following section highlights some of the reasons I think this.

### Not Unix

Nearly all of the server infrastructure in the world runs on Linux. This includes everything from the servers hosting the most popular websites, to the biggest supercomputers in the world. This makes Unix, which Linux is based on, a very important platform to learn in this era, especially for web developers. macOS is also based on Unix, which makes it similar in a way to Linux. Windows, on the other hand, is based on DOS. There's nothing wrong with this, but it means that Windows is fundamentally different from Linux or macOS, especially for development.

One big, visible difference between Windows and Unix is the **shell**. A shell is a command-line interpreter (CLI). It's a program that allows you to type text commands, and it's vital for many developer tasks, such as talking to a server, automation, running programs, and so on. Popular Unix shells like `bash` and `zsh` are industry standard, and used in many companies and projects. Essentially, learning Unix can be very valuable for your career.

Windows, on the other hand, doesn't offer a shell to talk to the computer through text. Instead, it has the "Command Prompt" program, and the newer "Powershell". They get the job done, but are very different from Unix shells, and aren't very popular.

### No package manager

Windows has no native package manager, and no consistent way to get the software you need for software development.

Want Python? go to their website, download an installer, run the installer, and then follow the (many) steps to complete the installation.

Want NodeJS, MySQL or Java? Download another installer, and follow different steps to get the software installed.

Installing software on Windows is tedious and inconsistent. For example, the installer might not set up your [PATH](<https://en.wikipedia.org/wiki/PATH_(variable)>) correctly, and now you can't run your software since the system can't find where it was installed.

On desktop Linux, a program called a "package manager" is often included. It's a handy program to install popular software by typing in your terminal program, or by using an included GUI. For example, on Linux systems based on [Debian](https://en.wikipedia.org/wiki/Debian), you can use `apt`:

```bash
apt install python
```

Now you have python installed. Do you want to install anything else? It's all one click or one command away.

On macOS, no package manager is available out of the box. However, [Brew](https://brew.sh) is a popular offering, and installing software with Brew is just as easy:

```bash
brew install python
```

Windows has improved massively in this area in the last few years. As of writing this, [winget-cli](https://github.com/microsoft/winget-cli) is a Windows native package manager that will soon become widely available. Third-party package managers for Windows, like [Chocolatey](https://chocolatey.org), already existed for a long time. However, I can't recommend them, since they are managed by a much smaller community than Brew or `apt`, and the quality can be lacking.

## Linux

I think Linux is the ideal platform for learning to code.

Software used to create important products and applications, like MySQL, Java, NodeJS, C++, Docker, Kubernetes, Apache Server, Nginx, Ruby, etc. are all developed to run primarily on Linux. if there's a server running important software, it's probably running Linux. This makes it the ideal OS for learning to code, since what you learn while using Linux will transfer well to when you will be deploying professional applications to your clients.

Linux is fast. It has very little overhead and uses very little CPU and memory compared to Windows. It's also free and open-source, making it easy for anyone to get a copy of Linux for their own uses, or to have a look at the source code.

However, The user experience of using Linux for desktop/laptop isn't very good. The community for this is small and fragmented, and isn't backed by a large company like Microsoft or Apple. This means that a lot of popular software (Adobe, Microsoft Office, OneDrive, video games, etc.) isn't well supported on Linux, or at all.

Also, most personal computers either have Windows or macOS installed. Using Linux on your computer will probably require you to install it yourself, which isn't something most people should need to do to use a computer.

### Running Linux alongside another OS

Despite the issue with running Linux for desktop/laptop, it can still be worth playing around with. An easy way to try Linux is to install it alongside another OS. This way, you get to learn Linux, and still have access to another, friendlier OS.

#### Virtual Machine

An easy way to try Linux is to run it in a virtual machine (VM). This allows you to try Linux in its own separate environment, without affecting your current machine in any way. You can then safely remove the VM if you don't need it anymore. Here's [a guide](https://itsfoss.com/install-linux-in-virtualbox) I recommend looking into if you're interested, but any recent guide on this subject should work fine.

However, VMs will run slower than if you run the OS natively. VMs also tend to require a lot of resources (CPU and memory), since you're sharing these resources between the host and the VM.

#### Windows Subsystem for Linux (WSL)

This option, exclusive to Windows, allows you to install Linux and run it alongside Windows. WSL has good integration with many popular tools, and can easily and safely be removed if you don't like it, just like with a VM.

I think this is a great option for things like web development and non-GUI application development. It's very useful and makes Windows a powerful option for developers.

However, WSL runs Linux in what you could call a "headless" mode. There is no Linux "GUI" you can access to run your Linux programs, and the only way you can talk with the Linux subsystem is through a CLI or the file system. This makes things like OpenGL or game development impossible or impractical on WSL.

See the [official documentation](https://docs.microsoft.com/en-us/windows/wsl/install) if you're using Windows and want to get started with WSL.

#### Dual Boot

With a Dual Boot, you install two or more operating systems on separate parts of your machine's storage, and you can boot into either of them. You can then run multiple operating systems on one machine.

This gives you the most uncompromised way to run Linux, without virtualization or having Linux be part of another OS.

However, I would not recommend doing this unless you know what you are doing. Dual-booting can be dangerous, and you could lose all of your files. Also, dual-booting isn't well supported by Windows, and you will run into issues that require you to tinker and waste time maintaining your system.

## macOS

If you want minimal hassle, Apple products are the way to go.

macOS is stable, high-quality and Unix-based. Most things work out of the box, with minimal tinkering and time-wasting. It's also the only OS where you can develop software for Apple devices, like iOS and Mac.

However, Apple devices are **expensive**. A Mac will cost you much more than an equivalent Windows or Linux machine.

Also, macOS isn't well suited for certain specialized workloads, such as game development or machine learning, since you are limited by what hardware Apple offers.

## Summary

Here is a summary of the pros and cons of each OS for the desktop/laptop, for easy reference.

I hope you've enjoyed reading this, and that you'll find my tips useful in finding the right OS for you :)

### Windows

- **Pros**
  - Most popular desktop OS, capable of running popular software on many different devices
  - WSL is a very powerful tool to run Linux applications natively
  - A very good option for game development, or Windows-only development
- **Cons**
  - Not Unix based
  - No native package manager (for now 👀)

### Linux

- **Pros**
  - Almost all developer software is available and well supported
  - A great learning opportunity, since Linux is widely used to run critical software all around the world
  - Can easily be installed alongside other operating systems
  - free (and open-source 👀)
- **Cons**
  - Poor user experience on desktop/laptop due to the small, fragmented community
  - Might require a lot of tinkering to get things working due to poor support for non-developer software

### macOS

- **Pros**
  - Very stable OS
  - Unix-based, so learning macOS will help with learning Linux
  - Very good user experience, with support for a lot of popular software
  - Minimal hassle and tinkering, things often work out of the box
- **Cons**
  - Apple machines are expensive 💸
  - No native package manager, you need to install Brew or other similar software
  - Not well suited for workloads requiring special hardware (game dev, machine learning, etc.)
