---
title: "Lessons From Voteit"
summary: "Sharing what I learned from developing VoteIt!"
date: 2022-10-30T22:46:29-07:00
lastmod: 2022-10-30T22:46:29-07:00
tags: ["programming", "voteit", "react", "golang"]
categories: []
draft: false
---

I'm not the best full-stack developer. I've had experience building websites for school or work, but I never went throught building a full-stack application by myself.

This sparked my interest to build [VoteIt](https://voteit.cristianaldea.com), since I saw an opportunity to build something unique, and learn about the process of designing, building, deploying, and maintaining a full-stack web application.

VoteIt is a voting app. There's nothing new about that concept, but I had a few requirements which I think brought a lot of value:

- You don't need to sign up
- You don't get bombarded with ads
- You get to do Ranked Voting, which is something I haven't seen offered online! This type of voting lets you rank the options, giving you a way to express preference (1st choice, 2nd choice, etc.)

In this blog post, I wanted to explain the lessons I've learned from building VoteIt, and hopefully it'll be useful to whoever reads this.

## What tutorials don't teach you

Building an application by following a tutorial online is very different from building something yourself. There are issues that come up that no tutorial can possibly account for which appear due to the unique quirks of your project.

### Technology choice

A very important choice is the technology you'll use.

For the front-end, I wanted something reliable and popular, so I went with <img src="/icons/react.png" class="inline-icon" alt="react logo"> React.

For the back-end, I wanted something fast, reliable, and easy to maintain, so I built my own API using Golang and [Fiber](https://github.com/gofiber/fiber).

Finally, for the database, I went with <img src="/icons/mongodb.png" class="inline-icon" alt="mongo db logo"> MongoDB, since it seemed like a good option for a no-sql database.

These decisions ended up having a big impact on my project, so choosing your tech stack is no joke.

Fireship has a great video on this subject:

{{< youtube Sxxw3qtb3_g >}}

For me, choosing to add a package or module came down to question: **Does the value it provides outweight the hassle of being reliant on it?**

A package can be useful, but if you could quickly implement the feature yourself, or if the package doesn't have a good maintainer that will keep it updated, then adding it to your project might do more harm than good. This is **very relevant** on platforms like the web and NPM, which are constantly evolving.

New <img src="/icons/javascript.png" class="inline-icon" alt="javascript logo"> JavaScript frameworks appeared and died in the time it took you to read this post 👀.

### Integration Hell

An issue that only comes up well into development is integration. Once you've built parts of your application, getting them to work together isn't always easy. Also, some issues don't surface until the final steps of development.

Some examples issues I ran into for my project were:

- form and input validation was much more involved than I expected, due to the many types of input I needed to handle
- drag and drop was a nightmare to try and implement, so I ended up using a library. I didn't know web APIs for drag-and-drop were so terrible 💀. Shoutout to [atlassian/react-beautiful-dnd](https://github.com/atlassian/react-beautiful-dnd) 🙏
- websocket implementation and testing was much harder than I thought
- fixing random bugs that would only show up late into development

[StuffMadeHere](https://www.youtube.com/c/StuffMadeHere) is a YouTube channel dedicated to creating crazy stuff, and these kinds of integration issues are something they comes across very often. Persisting through those issues to complete a project is an important skill to learn.

### Deployment

Deploying the application was initially very annoying, since I ended up doing most of the setup myself, mainly to save costs and to learn about how this stuff works.

I learned about things like creating a Virtual Private Server, setting up networking, setting up a proxy and HTTPS, and getting my application to run on the server. These lessons were very informative to me, but it took me a long time to push through the roadblocks I was facing.

## Prioritization and endless refactors

When you're working on a personal project, you're not bound by deadlines or expectations, since usually you don't have any users.

This was something that negatively impacted the development of VoteIt, and made it take much longer than it should have.

I would end up working on minor features or things I found interesting, while not addressing issues or features important to end-users.

One egregious example was when I completely refactored the backend from using express.js (which wasn't a good fit) to Golang. Although this refactor was helpful in the end, it took a long time and didn't change anything for the user experience.

### Why are you building this?

To solve the issue of prioritizing, what helped me was to focus on why I was building this application. I wanted a way to have a decision made in a group quickly and easily. From there, I tried to derive the process I'd need to take, and stuck with that. That mindset helped a lot with completing the project.

There's always a better way to do something in software engineering. An important skill to learn is knowing when something is good enough to fulfill the requirements you have.

## Why we write tests

Initially, I had no tests for the project. However, as the project grew larger and larger, I lost confidence in the code I was writing, sometimes breaking features during development and only knowing after deployment.

That's when I knew I needed tests. My testing setup evolved over time, and ended up being as follow:

- Unit tests for functions that are pure or whose dependencies could be mocked
- Integration testing for the backend API using Postman
- End-to-end testing using Cypress for whole application

Testing is a useful way to check the behavior of your application in a declarative way. However, testing should only be done if it will bring more value to you than the time you spend on it.

Some will tell you that testing is useless. Other will tell you that you should test everything. That's all nonsense, because it depends on the context.

If a part of your application is critical or has security or availability requirements, then testing it is a requirement to avoid customer impact. However, spending hours writing tests for the sake of writing tests or metrics is just a waste of your precious time and energy as a developer.

## You made it, ready to keep it?

One last thing to consider when making a full-stack application is maintenance. Once you're done with most of the development, you'll need to worry about server costs, logging, alerting and bug fixing so it can continue to provide value to users. Are you ready to commit to that?

This is something I hadn't considered when starting the project, and it's something I'll keep in mind when starting my next project.

Thanks for reading! If you have any feedback, share it on social media or by using the "Leave Feedback" above.
