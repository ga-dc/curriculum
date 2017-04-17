#!/bin/bash

set -o errexit -o nounset

rev=$(git rev-parse --short HEAD)

cd _book

git init
git config user.name "Jesse Shawl"
git config user.email "jesse@jshawl.com"

git remote add upstream "https://$GH_TOKEN@github.com/ga-dc/pbj.git"
git fetch upstream
git reset upstream/gh-pages

touch .

git add -A .
git commit -m "rebuild pages at ${rev}"
git push -q upstream HEAD:gh-pages