#!/usr/bin/env sh
PKG_REPO=$PWD

mkdir ../drat

## Set up Repo parameters
git -C ../drat init
git -C ../drat config user.name "Build Pusher"
git -C ../drat config user.email "michal2992@example.com"
git -C ../drat config --global push.default simple

## Get drat repo
git -C ../drat remote add upstream "https://$GH_TOKEN@github.com/mbojan/drat.git"
git -C ../drat fetch upstream 2>err.txt
git -C ../drat checkout gh-pages

Rscript.exe -e "drat::insertPackage('$PKG_REPO/$PKG_ZIP', \
repodir = '../drat', \
commit='Travis update: build $TRAVIS_BUILD_NUMBER on Windows')"
git push 2> /tmp/err.txt

