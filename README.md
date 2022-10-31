# Starlog

This repository contains the source code for my blog, Starlog!

It uses [Hugo](https://gohugo.io) and is based on the excellent [Papermod](https://github.com/adityatelange/hugo-PaperMod) theme.

## Development

To be able to work on this project, you will need [to install Hugo](https://gohugo.io/getting-started/installing).

Then, you'll need to resolve this project's submodules:

```bash
git submodule update --init
```

## Deployment

to deploy this website, you can use the [deploy.sh](deploy.sh) script. It will:

- delete the `gh-pages` branch and then checkout to a brand new `gh-pages` branch, whose HEAD is the same as main
- create the changes and commits necessary for the deployment
- push the changes
