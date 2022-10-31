---
title: "Hugo vs. GatsbyJS"
summary: "I'll explain my reasoning behind choosing Hugo for my blog over GatsbyJS."
date: 2021-11-05
lastmod: 2022-04-21
tags: ["programming", "hugo", "gatsbyjs"]
categories: []
---

When I decided to create a blog, I knew I needed a static site generator. While researching, I found many popular options listed on websites like [jamstack.org](https://jamstack.org/generators), and narrowed down my choices to [GatsbyJS](https://www.gatsbyjs.com/) or [Hugo](https://gohugo.io/).

I ended up going with Hugo for now, and this post will explain why. If you're also looking to start a blog, use the information below to inform your decision, and pick whatever is the best fit for you.

## Faster Build Times

First, my biggest issue with Gatsby was the build times. Builds with Hugo are much faster than with Gatsby, which helps with the development experience.

### Build Time Comparison

To be precise, I did some benchmarks of the build times between Hugo and Gatsby (taken from the logs), and summarized everything in the table below. I compared the following projects:

- **Starlog**: created with Hugo, with two posts and a theme
- **Blank Gatsby**: a Gatsby project created using `npm init gatsby`, with no posts
- **Gatsby blog starter**: a Gatsby project using the official [Gatsby blog starter](https://www.gatsbyjs.com/starters/gatsbyjs/gatsby-starter-blog/), with no posts

| Metric                    | Starlog | Blank Gatsby | Gatsby blog starter |
| :------------------------ | :-----: | :----------: | :-----------------: |
| Initial development build | 0.037s  |   13.156s    |       14.622s       |
| Rebuild on code change    | 0.008s  |    0.197s    |       0.293s        |
| Production build          | 0.061s  |   23.967s    |       31.349s       |

The difference is **substantial**. With Hugo, the builds felt **instantaneous**, while with Gatsby, the builds felt much slower.

However, the biggest pain point was Gatsby's rebuilds on code changes. Despite what the logs say, it felt like it took a second or two for me to see the changes in the browser after making changes in Gatsby.

Keep in mind that the Gatsby build times were for projects with **no posts**. As you add plugins and posts the build time can get **much** longer.

### Why is Hugo faster?

There are two main reasons why Hugo's builds are considerably faster:

1. Golang vs JavaScript (JS)
   - Hugo is implemented in [Golang](https://github.com/gohugoio/hugo) and compiled into a binary
   - Gatsby is implemented in [JavaScript](https://github.com/gatsbyjs/gatsby). JavaScript isn't compiled[^1] and is dynamically typed, which typically leads to slower code
2. Templating vs React
   - Hugo uses [Golang templating](https://gohugo.io/templates/introduction), which uses simple rules and constructs, and is processed very quickly
   - Gatsby runs the React library to generate the DOM tree for every page and then renders each tree into static HTML, which is a much more complicated and lengthy process

## Overkill

This is something I will explore in more detail in a future post. For now, you need to understand that each tool has its use.

Gatsby is a clever framework with a lot of cool features:

- it uses React, which makes it easy to develop dynamic applications through declarative code
- it pre-renders your pages, to improve performance and Search Engine Optimization (SEO)
- it "[hydrates](https://reactjs.org/docs/react-dom.html#hydrate)" your pages, keeping them dynamic as if it was a regular React app

It blends the best of both worlds, keeping the performance of a static website, while allowing for the dynamic rendering of a single-page application.

However, my blog will be serving mostly static content, and wouldn't benefit much from the strengths of React or Gatsby. It **would** however be **much** slower and bloated than it needs to be.

### npm Bloat

Using Gatsby and npm leads to a lot of bloat. From my experience, npm projects are hard to maintain. You rely on countless packages maintained by thousands of contributors. When you revisit an npm project after a while, you'll often find that your dependencies are outdated or abandoned, and updating them can lead to a lot of frustration, especially if the project was abandoned.

npm has matured a lot, but is still very volatile. I wanted to minimize how many dependencies I had for this simple project. With Hugo, all I needed was the Hugo CLI and a theme, which just requires me to copy some files around.

### A lot of JavaScript

Gatsby applications need **a lot** of JavaScript to work, since React relies on a client-side JavaScript runtime to keep the pages dynamic.

The table below outlines the HTML and JS content for each of the projects listed earlier, using the following command:

```bash
# for html
find public/ -type f -name '*.html' -exec du -ch -B KB {} +

# for js
find public/ -type f -name '*.js' -exec du -ch -B KB {} +
```

| Metric             | Starlog | Blank Gatsby | Gatsby blog starter |
| :----------------- | :-----: | :----------: | :-----------------: |
| HTML Content       |  152kB  |     17kB     |        201kB        |
| JS Content         |  123kB  |    283kB     |        345kB        |
| Total Website Size |  459kB  |    1139kB    |       3597kB        |

Hugo mostly outputs HTML code. The JavaScript code is from the code block highlighting support, and can easily be removed.

Although JavaScript is very powerful and flexible, it's also the most expensive thing to ship to the browser. Every byte of JavaScript you send to a browser takes much more time and energy to process than HTML or CSS, which are simple to parse and execute.

If you don't need your app to be very dynamic, then you don't need a lot of JavaScript. This will lead to your websites being slimmer and faster than they possibly could be with a framework like React or Angular.

[The Vanilla JavaScript Podcast](https://vanillajspodcast.com/) has a lot of nice episodes explaining the issue I've described with JavaScript if you want to learn more.

A few episodes I liked:

- <https://vanillajspodcast.com/the-developer-experience-is-bullshit>
- <https://vanillajspodcast.com/how-i-structure-my-vanilla-js-projects>
  - (My projects used to be based on this template! It's very good)
- <https://vanillajspodcast.com/the-web-is-getting-slower>

## Simplicity

I was already very familiar with JavaScript, npm, and React when I decided to create Starlog. Gatsby would have been a good fit considering my skills. Hugo, on the other hand, [has a templating engine](https://gohugo.io/templates/introduction) that I didn't know very well.

Despite this, I found that learning Hugo was easier for me than learning Gatsby, due to how much more complicated the Gatsby ecosystem is, with the seemingly endless choices it offers in terms of plugins and configuration.

## Self-congratulating

While researching the pros and cons of Hugo and Gatsby, something that annoyed me was an article from Gatsby [comparing JAMstack technologies](https://www.gatsbyjs.com/features/jamstack/).

The review article has an obvious conflict of interest, since it's published and controlled by Gatsby. Also, the article wasn't very useful to me because:

- they compare the products on very generic criteria, without explaining how they reached the scores they got
- they list very few losing comparisons for Gatsby, making it seem like the perfect solution in all situations (which isn't the case)
- they claim that Hugo has poor "Modern JavaScript syntax" support, which is strange. Hugo has long supported [ESBuild](https://gohugo.io/hugo-pipes/js), which allows you to bundle and transpile your JavaScript code to keep it compatible with older browsers
- they list redundant points, such as having excellent "Componentization", "Component libraries" and "Component ecosystem". Well organizing your code and using templates, you can also achieve good reuse of code through Hugo, so this isn't very useful.
- they add "Swag store" as one of the upsides of Gatsby. Why is this here? I thought we were comparing frameworks here! 🤣

This doesn't affect my appreciation of Gatsby as a project, but it did put a dent in my impression of the company.

## Conclusion

Although Gatsby is a great project, I didn't think it was a good fit for me. I wasn't going to leverage its strengths, and its downsides were too annoying to me.

If you feel like the downsides I listed wouldn't be a deal-breaker for you, feel free to pick up Gatsby, I had a lot of fun while trying it out.

For now, I'll be using Hugo. But that might very well change in the future.

[^1]: JavasScript runs on the [V8 JavaScript Engine](https://nodejs.dev/learn/the-v8-javascript-engine). It's not strictly "interpreted", since the engine does a lot of clever tricks to speed up JavaScript execution (although it's still slower than a compiled, statically-typed language like Go). For more details see [this post](https://www.freecodecamp.org/news/JavaScript-under-the-hood-v8) I found on the subject.

## References

- https://css-tricks.com/comparing-static-site-generator-build-times/
