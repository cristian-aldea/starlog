---
title: "Hugo vs. GatsbyJS"
summary: "I'll explain my reasoning behind choosing Hugo for my blog over GatsbyJS."
date: 2021-11-05
tags: ["hugo", "gatsbyjs"]
categories: ["programming"]
---

When I decided to create Starlog, I found that a static site generator was what I needed. I found lists of popular options on websites like [jamstack.org](https://jamstack.org/generators) to help me get started.

After doing some research, I narrowed down my choices to [GatsbyJS](https://www.gatsbyjs.com/) or [Hugo](https://gohugo.io/), and ended up going with Hugo for now.

This post will detail the reasons behind my choice. Hopefully, it will help you make an informed decision on what static site generator is best for you.

## Faster Build Times

To start, my biggest gripe against Gatsby was the build times. Hugo can build websites much faster than Gatsby, which leads to a better development experience.

### Build Time Comparison

I did some quick benchmarks of the build times for Hugo and Gatsby, to get a general idea of their relative speed. Here are the projects I used:

- **Starlog**: created with Hugo, with two posts and a theme
- **Gatsby**: a Gatsby project created using `npm init gatsby`, with no changes
- **Gatsby blog starter**: a Gatsby project using the official [Gatsby blog starter](https://www.gatsbyjs.com/starters/gatsbyjs/gatsby-starter-blog/), with no changes

I took the values from the stated times shown in the logs.

| Metric                               | Starlog | Gatsby  | Gatsby blog starter |
| :----------------------------------- | :-----: | :-----: | :-----------------: |
| Development build                    | 0.037s  | 13.156s |       14.622s       |
| Development rebuild (on code change) | 0.008s  | 0.197s  |       0.293s        |
| Production build                     | 0.061s  | 23.967s |       31.349s       |

The difference is **shocking**. With Hugo, the builds felt **instantaneous**, while with Gatsby, the builds felt noticeably slower.

Gatsby implements a build cache, which can help slightly. Gatsby also offers incremental builds through Gatsby Cloud, but that's effectively a vendor product you're locking yourself into for deployments, which wasn't ideal for me.

My main issue with Gatsby was the development rebuilds. Every time I made a change to my code, it would take a second or two to see the change in my browser.

Keep in mind that these build times can get much longer as you add more plugins and content.

### Why is Hugo faster?

There are a few reasons why Hugo builds are considerably faster:

1. Golang vs JavaScript (JS)
   - Hugo is implemented in [Golang](https://github.com/gohugoio/hugo) and compiled into a binary
   - Gatsby is implemented in [JavaScript](https://github.com/gatsbyjs/gatsby), and runs[^1] on the [V8 JavaScript Engine](https://nodejs.dev/learn/the-v8-javascript-engine), which leads to slower code execution
2. Templating vs React
   - Hugo uses [Golang templating](https://gohugo.io/templates/introduction), which uses simple rules and constructs, and can be processed quickly
   - Gatsby needs to run the React library to build your DOM tree and then render it into static HTML, which is a much more complicated and lengthy process

## Overkill

Gatsby is a clever framework with a lot of cool features:

- it uses React, which makes it easy to develop dynamic user interfaces through declarative code
- it pre-renders your pages, to improve performance and Search Engine Optimization (SEO)
- it "[hydrates](https://reactjs.org/docs/react-dom.html#hydrate)" your pages, keeping them dynamic like a regular React app

It blends the best of both worlds, keeping the performance of a static website, while allowing for the dynamic rendering of a single-page application.

However, my project wouldn't benefit much from this approach, since most of the content would be static, with few exceptions.

## A lot of JavaScript

Related to the previous point, the result of Gatsby's approach is that it needs **a lot** more JavaScript for your application to work, since React relies on a client-side JavaScript runtime.

The table below outlines the HTML and JS content for each of the projects listed earlier, using the following command:

```bash
# for html
find public/ -type f -name '*.html' -exec du -ch -B KB {} +

# for js
find public/ -type f -name '*.js' -exec du -ch -B KB {} +
```

| Metric             | Starlog | Gatsby | Gatsby blog starter |
| :----------------- | :-----: | :----: | :-----------------: |
| HTML Content       |  152kB  |  17kB  |        201kB        |
| JS Content         |  123kB  | 283kB  |        345kB        |
| Total Website Size |  459kB  | 1139kB |       3597kB        |

Hugo mostly outputs HTML code. The JavaScript code is mostly for code block highlighting support, which I can drop if I want.

Gatsby mostly outputs JavaScript code. Some of this code is used to load the runtime React depends on to function, which as I explained earlier isn't something my project would benefit much from.

## Learning Curve

This, oddly, is not a strong point against Gatsby for me.

I was already very familiar with JavaScript, npm, and React when deciding to create this blog, and I was unfamiliar with [Hugo's templating](https://gohugo.io/templates/introduction). I already knew most of what I would need to use Gatsby effectively.

Despite this, I found that learning Hugo was easier for me than learning Gatsby, due to the sheer amount of configuration and plugins Gatsby offers.

## Self-congratulating

While researching the pros and cons of Hugo and Gatsby, something that annoyed me was an article from Gatsby [comparing Gatsby, Jekyll, and Hugo](https://www.gatsbyjs.com/features/jamstack/gatsby-vs-jekyll-vs-hugo).

Making a review of your product is already a bad look, and this article wasn't as helpful as I'd hoped:

- they chose a list of features for which they have few losing comparisons
- they claim that Hugo has no "Modern JavaScript syntax" support. This is false because Hugo supports [ESBuild](https://gohugo.io/hugo-pipes/js), which, much like other bundlers, allows you to use modern JavaScript syntax while keeping your code compatible with older browsers
- they list redundant points, such as having excellent "Componentization", "Component libraries" and "Component ecosystem"
- they add "Swag store" as one of the upsides of Gatsby, which is _hilarious_

This doesn't affect the quality of the product itself, but it's not a good look.

## Conclusion

Although Gatsby is very cool, I didn't feel it was a good fit for my project since I wasn't going to leverage its strengths, and its downsides were too annoying to me.

If you feel like my criticisms of Gatsby aren't very applicable to your situation, then feel free to pick it up and try it out for your next project, since I think it's an excellent framework despite its issues.

For now, I'll be using Hugo. But that might very well change in the future.

[^1]: I found that using the word "interpreted" here would be wrong since an engine like V8 does a lot of clever tricks to speed up JavaScript execution (although it's still slower than a compiled language). For more details see [this post](https://www.freecodecamp.org/news/JavaScript-under-the-hood-v8) I found on the subject.
