---
title: "Why I chose Hugo"
summary: "I'll explain my reasoning behind choosing Hugo for my blog over other frameworks."
date: 2021-11-02
tags: ["hugo", "gastbyjs"]
draft: true
---

To make my blog, I had many choices on which framework I should choose. Helpful websites like [jamstack.org](https://jamstack.org/generators/) gave lists of site generators which I could look into and try ouy.

After doing some cursory research on the most popular frameworks, I narrowed down my choice to either GastbyJS or Hugo, and I ended up going with Hugo for now. I might be wrong, and Gastby or another option will be more viable for me in the future as I work on this blog, but for now Hugo seemed like the best choice for me.

Here is the reasoning behind my choice.

## Build Times

Development and production builds are much faster with Hugo than with Gastby. I did some quicks tests to compare the build times and the results shocked me.

### Test Results

Here is a table comparing the build times for:

- **Starlog**: created with Hugo, with two posts and a theme
- **Gastby plain**: a plain Gastby project created using `npm init gatsby`, with no changes
- **Gastby starter**: a Gastby project using the [gatsby-starter-blog](https://www.gatsbyjs.com/starters/gatsbyjs/gatsby-starter-blog/) starter, with no changes

I took the times from the logs of each respective project, taking the stated time.

| Metric              | Starlog | Gastby plain | Gastby starter |
| :------------------ | :-----: | :----------: | :------------: |
| Development build   |  37 ms  |   13.156s    |    14.622s     |
| Development rebuild |  8 ms   |    0.197s    |     0.293s     |
| Production build    |  61 ms  |   23.967s    |    31.349s     |

The difference is huge. Hugo is orders of magnitudes faster to run on my machine than Gastby. Gastby takes a very long time to build, despite running on my top-end CPU.

With the hugo project, the builds felt **instantaneous**, no joke.

With the two Gastby projects, everything felt much slower. The development rebuilds were especially annoying, since it would take about a second or two for my changes to show up in the browser, something which happened instantly with Hugo. The build cache helps, but it still doesn't come close to Hugo's build times.

The build times with Gastby could be much worse with more content and plugins. If I included other plugins I liked, such as:

- [gatsby-plugin-typescript](https://www.gatsbyjs.com/plugins/gatsby-plugin-typescript)
- [gatsby-plugin-sass](https://www.gatsbyjs.com/plugins/gatsby-plugin-sass)

### Why is the difference so huge?

There are multiple reasons why Hugo has a clear advantage when it comes to build speed:

- hugo is implemented in Golang, and uses simple templating to get the job done
- Gastby needs to run the React javascript runtime to render your pages, and webpack needs to bundle your code. This all runs in Javascript, which isn't as fast as Golang due to being an interpreted language.

## A lot of Javascript

Gastby is nice. It uses React, which is awesome for developing reactive, dynamic applications. It renders your pages at build time, to improve performance and SEO, while still keeping your application as reactive as any other React app.

However, one big problem for me is that it ships a ton of javascript in the production bundle, since it needs to load a big javascript runtime in the brownser for your code to work properly.

The table below outlines the bundle size for each of the projects listed earlier, using the following command:

```bash
du -ha -B KB public
```

| Metric                | Starlog | Gastby plain | Gastby starter |
| :-------------------- | :-----: | :----------: | :------------: |
| Bundle Size           |  451kB  |    1131kB    |     3584kB     |
| Bundle Size (no maps) |  451kB  |    369kB     |     2597kB     |

Although the bundle size shrinks when you exclude maps, most of the bundle size from Hugo comes from un-minified HTML, while Gastby's bundle size comes from Javascript files, which are responsible for operating the javascript runtime that React requires to function.

For a simple blog, having such a runtime is overkill. An advantage of having a single page application is that the page can be rerendered using Javascript without making any additional requests. In my case I didn't see it being much of an advantage, since a user would need to browser a large number of articles on Hugo before they would start to download more than with Gastby.

## Learning Curve

I was already familiar with npm, React and the Go templating language, so for either Hugo or Gastby the learning curve wasn't big for me.

## Conclusion

Although Gastby is good, a offer many features, most of which I have not mentionned (GraphQL support out of the box, etc.., TODO). Most of those features weren't useful to me, and the downsides with Gastby were too big.
