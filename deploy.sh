#!/bin/bash

git checkout main
git branch -D gh-pages
git checkout -b gh-pages

rm -rf docs/
mkdir docs/
echo "blog.cristianaldea.com" > docs/CNAME
git add docs/
git commit -m "Create CNAME"

hugo
cp -R public/* docs
git add docs/
git commit -m "Deploy website"

git push -u origin gh-pages --force-with-lease
git checkout main
