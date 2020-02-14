#!/usr/bin/env sh
PKG_REPO=$PWD

cd ..; mkdir drat; cd drat

## Set up Repo parameters
git init
git config user.name "Build Pusher"
git config user.email "michal2992@example.com"
git config --global push.default simple

## Get drat repo
git remote add upstream "https://$GH_TOKEN@github.com/mbojan/drat.git"
git fetch upstream 2>err.txt
git checkout gh-pages

# Debugging
echo $PKG_REPO
ls $PKG_REPO

Rscript.exe -e "drat::insertPackage('$PKG_REPO/$PKG_ZIP', \
repodir = '.', \
commit='Travis update: build $TRAVIS_BUILD_NUMBER on Windows')"
git push 2> /tmp/err.txt

