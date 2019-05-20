#!/bin/bash

GH_REPO="@github.com/elopio/tangamandapio.git"

FULL_REPO="https://$GH_TOKEN$GH_REPO"

cp keybase.txt output
cd output

echo elopio.net > CNAME

git init
git config user.name "elopio-travis"
git config user.email "travis"

git add .
git commit -m "Deployed to github pages."
git push --force --quiet $FULL_REPO master:gh-pages
