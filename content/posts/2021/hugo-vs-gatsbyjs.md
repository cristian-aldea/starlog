---
title: "Hugo vs. GatsbyJS"
summary: "I'll explain my reasoning behind choosing Hugo for my blog over GatsbyJS."
date: 2021-11-05
lastmod: 2022-01-30
tags: ["hugo", "gatsbyjs"]
categories: ["programming"]
---

When I decided to create a blog, I knew I needed a static site generator. While researching, I found many popular options listed on websites like [jamstack.org](https://jamstack.org/generators), and narrowed down my choices to [GatsbyJS](https://www.gatsbyjs.com/) or [Hugo](https://gohugo.io/).

I ended up going with Hugo for now, and this post will explain why. If you're also looking to start a blog, use the information below to inform your decision, and pick whatever is the best fit for you.

## Faster Build Times

First, my biggest issue with Gatsby was the build times. Builds with Hugo are much faster than with Gatsby, which helps with the development experience.

### Build Time Comparison

To be precise, I did some benchmarks of the build times between Hugo and Gatsby (taken from the logs), and summarized everything in the table below. I compared the following projects:

- **Starlog**: created with Hugo, with two posts and a theme
- **Gatsby**: a Gatsby project created using `npm init gatsby`, with no posts
- **Gatsby blog starter**: a Gatsby project using the official [Gatsby blog starter](https://www.gatsbyjs.com/starters/gatsbyjs/gatsby-starter-blog/), with no posts

| Metric                    | Starlog | Gatsby  | Gatsby blog starter |
| :------------------------ | :-----: | :-----: | :-----------------: |
| Initial development build | 0.037s  | 13.156s |       14.622s       |
| Rebuild on code change    | 0.008s  | 0.197s  |       0.293s        |
| Production build          | 0.061s  | 23.967s |       31.349s       |

The difference is **very clear**. With Hugo, the builds felt **instantaneous**, while with Gatsby, the builds felt much slower.

Gatsby has a build cache, but even with this Gatsby's builds weren't even close to Hugo's.

However, the biggest annoyance was Gatsby's rebuilds on code changes. Despite what the logs say, it would take a second or two for me to see the changes in the browser.

Keep in mind that the Gatsby build times were for projects with **no posts**. As you add plugins and posts the build time can get much longer.

### Why is Hugo faster?

There are two main reasons why Hugo builds are considerably faster:

1. Golang vs JavaScript (JS)
   - Hugo is implemented in [Golang](https://github.com/gohugoio/hugo) and compiled into a binary
   - Gatsby is implemented in [JavaScript](https://github.com/gatsbyjs/gatsby), and runs[^1] on the [V8 JavaScript Engine](https://nodejs.dev/learn/the-v8-javascript-engine), which leads to slower code execution
2. Templating vs React
   - Hugo uses [Golang templating](https://gohugo.io/templates/introduction), which uses simple rules and constructs, and is processed very quickly
   - Gatsby runs the React library to generate the DOM tree for every page and then renders each tree into static HTML, which is a much more complicated and lengthy process

## Overkill

Gatsby is a clever framework with a lot of cool features:

- it uses React, which makes it easy to develop dynamic applications through declarative code
- it pre-renders your pages, to improve performance and Search Engine Optimization (SEO)
- it "[hydrates](https://reactjs.org/docs/react-dom.html#hydrate)" your pages, keeping them dynamic as if it was a regular React app

It blends the best of both worlds, keeping the performance of a static website, while allowing for the dynamic rendering of a single-page application.

However, my blog will be serving mostly static content, and wouldn't benefit much from using React or Gatsby.

## npm Bloat

Using Gatsby and npm leads to a lot of bloat. npm projects can be hard to maintain, since you rely on countless packages. When you revisit an npm project after a while, you'll often find that packages you relied on are outdated or abandoned, and that updating them can lead to breaking changes and complications.

For something as simple as a blog that I would update from time to time, using Hugo felt like a better fit.

## A lot of JavaScript

Gatsby applications need **a lot** of JavaScript to work, since React relies on a client-side JavaScript runtime to keep the pages dynamic.

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

Hugo mostly outputs HTML code, due to the two posts I created with it. The JavaScript code is from the code block highlighting support, and can easily be removed.

Gatsby mostly outputs JavaScript to make sure it can keep your pages hydrated, which as I explained earlier isn't something my project would benefit much from.

## Learning Curve

I was already very familiar with JavaScript, npm, and React when I decided to create a blog, and Gatsby plays well with people who already have these skills. Hugo, on the other hand, [has a templating engine](https://gohugo.io/templates/introduction) that I didn't know very well.

Despite this, I found that learning Hugo was easier for me than learning Gatsby, due to the sheer amount of configuration and plugins Gatsby offers.

## Self-congratulating

While researching the pros and cons of Hugo and Gatsby, something that annoyed me was an article from Gatsby [comparing JAMstack technologies](https://www.gatsbyjs.com/features/jamstack/).

The article has an obvious risk of being biased, since it's published and controlled by Gatsby. On top of that, the content of the article was less than helpful:

- they compare the products by "Feature Availability", which is hard to qualify when they don't explain the reasoning behind the ratings
- they list very few losing comparisons, as if Gatsby is ideal/perfect in most situations
- they claim that Hugo has poor "Modern JavaScript syntax" support, which is strange. Hugo was long supported [ESBuild](https://gohugo.io/hugo-pipes/js), which, allows you to bundle your modern Javascript code and keep it compatible with older browsers
- they list redundant points, such as having excellent "Componentization", "Component libraries" and "Component ecosystem"
- they add "Swag store" as one of the upsides of Gatsby, which is _hilarious_ for an article that is ostensibly comparing the merit of various JAMstack frameworks

This doesn't affect my appreciation of Gatsby as a project, but it did put a dent in my impression of the company that published this article

## Conclusion

Although Gatsby is a great project, I didn't think it was a good fit for my blog since I wasn't going to leverage its strengths, and its downsides were too annoying to me.

If you feel like the downsides I listed wouldn't be a deal-breaker for your project, feel free to pick up Gatsby and try it out.

For now, I'll be using Hugo. But that might very well change in the future.

[^1]: I found that using the word "interpreted" here would be wrong since an engine like V8 does a lot of clever tricks to speed up JavaScript execution (although it's still slower than a compiled language). For more details see [this post](https://www.freecodecamp.org/news/JavaScript-under-the-hood-v8) I found on the subject.
