---
title: "Lessons From Voteit"
summary: "Sharing what I learned from developing VoteIt!"
date: 2022-10-30
lastmod: 2022-10-30
tags: ["programming", "voteit", "lessons", "react", "golang"]
categories: []
draft: false
---

[VoteIt](https://voteit.cristianaldea.com) is a voting app I made. It's not a new concept, but I wanted to make a few features would bring a lot of value:

- You don't need to sign up
- You don't get bombarded with ads
- You get the option of Ranked Voting! This let's you express preference between option (1st choice, 2nd choice, etc.) and isn't something I've seen online yet.

Before VoteIt, I never built a full-stack application on my own. Now that I've completed the project, I see a lot of things which I wish I knew, and certain things I wish I did differently.

In this blog post, I wanted to explain the lessons I've learned from building VoteIt, and hopefully it'll help you in your next project!

## Technology Stack

An important choice is the technologies you'll use in your project. This isn't always an easy choice, as your project might have unique requirements, or you might be more familiar with specific tools.

For anyone curious, here's the stack I went with in my project:

- For the front-end, I wanted something reliable and popular, so I went with <img src="/icons/react.png" class="inline-icon" alt="react logo"> React, since
- For the back-end, I wanted something fast, minimal, and easy to maintain. I built an http API using Golang and [Fiber](https://github.com/gofiber/fiber).
- Finally, for the database, the data types I had to deal with were simple, and so wanted something simple and unstructured (NoSQL). A popular choice was <img src="/icons/mongodb.png" class="inline-icon" alt="mongo db logo"> MongoDB, so I went with that.

These decisions ended up having a big impact on my project. And if I had the chance to start the project all over again, I would have taken more time to research my options in this phase.

## Dependencies

One danger to consider is over-enginerring your project. Fireship had a great video on this subject:

{{< youtube Sxxw3qtb3_g >}}

It was helpful for me, and for the long term health of the project, to be very conservative when adding new dependencies to VoteIt. When I say "dependency" I mean any packages or libraries that weren't made by me. If it wasn't a hassle to implement a feature, I probably did it myself.

Adding dependencies can speed up development, but can also have downsides if you're not careful of the quality of the code you're bringing into your project:

- It might get abandoned by it's maintainer, leaving the project dead with issues that won't get fixed
- It might contain bugs or security issues which are hard to work around
- It might make other dependencies you'd want to add incompatible or complicate your project or build process

You shouldn't completely avoid all dependencies for your project, but the fewer you have the easier it will be to maintain them.

## Prioritization

When I was working on this personal project, I didn't have deadlines or expectations. This was something that made the development of VoteIt slower than it needed to be. I'd work on problems or refactors that didn't affect the functionality much, instead of focusing on the experience I wanted for the end user.

What helped me push through these bad habits was keeping in mind focused on why I was making VoteIt: to have an easy and reliable way to get decisions done in a group. Also, I kept reminding myself that there's always a "better" way to do something in software engineering. An important skill to learn is knowing when the code is "good enough", and can satisfy the requirements you have.

## Integration hell

An issue that only comes up well into development is integration. I feel like a lot of incomplete project stop at this stage. Once you've built parts of your application, getting them to work together isn't always easy. Also, some issues don't surface until the final steps of development. These issues might be unique to your project and hard to troubleshoot, but they are a normal part of development and nothing to worry about.

Some examples issues I ran into for my project were:

- form and input validation was much more involved than I expected, due to the many kinds of ways users could input votes
- drag and drop was a nightmare to try and implement, since the web APIs for it aren't very refined. I ended up using a library which lead to a lot of troubleshooting of new issues that came up. Shoutout to [atlassian/react-beautiful-dnd](https://github.com/atlassian/react-beautiful-dnd) 🙏, an amazing project.
- reliably testing my websocket implementation was hard due to the many rules of the system I built. New issues could come up that I didn't account for which ate up a lot of time to fix.

[StuffMadeHere](https://www.youtube.com/c/StuffMadeHere) talk about this phenomenon in many of his projects. Accepting it as a normal part of engineering and persisting through them is how projects get done.

## Deployment

Once you've developed the app, you'll need to find some way to deliver it to your users. This depends on the platform you're developing for. Websites usually need a server, mobile apps can be published on the app store, and games can be distributed with a storefront like Steam.

I had to setup some way for people to see my website. I learned a lot about how webservers work by going through the process of creating my own from stratch: configuring the VPS, setting up the OS, setting up networking, and implementing secure connections using HTTPS. I could have gone with a simpler solution, but I was in it for the learning, and I can always change it later.

There are many options in this space. If you're not sure where to start and I'd recommended going with simple and "batteries included" solutions like [Firebase](https://firebase.google.com) or [AWS Amplify](https://aws.amazon.com/amplify) so you can get up and running as soon as possible.

## The reason why we test

Initially, I had no tests for the project, which worked fine since everything was simple at first. As the project grew larger, this started to become an issue. I lost confidence in the code I was writing, sometimes breaking features unknowingly.

That's when I naturally gravitated to testing. Tests are an amazing, declarative way to make sure your code does what it should be doing. For anyone curious, my testing setup evolved over time, and ended up being as follows:

- Unit tests for functions that are pure or whose dependencies could be mocked
- Integration testing for the backend API using Postman
- End-to-end testing using Cypress for whole application

However, it's important to write tests for a good reason, they should be simple, or at least, simpler than the code they're testing. If you're spending hours writing tests for a part of your app that has no business impact, then you're wasting precious hours that could have been spent somewhere else. However, if you don't test the parts of your code that are critical to requirements or security, then you might end up wasting a lot of time troubleshooting bugs or manually testing every time you make a change.

## Maintaining

Something I didn't consider when creating VoteIt was maintenance. Once a project is done, it'll likely need some sustained effort to keep it running without issues. You should consider things like server costs, logging and alerting when thinking of how you'll be handling a project in the long-term.

Thanks for reading! If you have any feedback, share it on social media or by using the "Leave Feedback" above.
