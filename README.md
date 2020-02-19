
<!-- README.md is generated from README.Rmd. Please edit that file -->

# travispkg

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/mbojan/travispkg.svg?branch=master)](https://travis-ci.org/mbojan/travispkg)
<!-- badges: end -->

This is a proof-of-concept dummy R package that aims to use TravisCI to:

  - Run `R CMD check` on Linux, MacOS, and **Windows**.
  - Push package tarball, MacOS binary, and Windows binary to a
    [drat](https://github.com/eddelbuettel/drat) repository, as proposed
    [here](https://cran.r-project.org/web/packages/drat/vignettes/CombiningDratAndTravis.html)

To that end the `.travis.yml` runs script files kept in `.travis`
folder.

Built packages are pushed to drat repository at
<https://mbojan.github.io/drat> and can be inspected with

``` r
a_src <- available.packages(repos="https://mbojan.github.io/drat")
"travispkg" %in% rownames(a_src)
#> [1] TRUE
a_winbin <- available.packages(repos="https://mbojan.github.io/drat", type="win.binary")
"travispkg" %in% rownames(a_winbin)
#> [1] TRUE
```

and installed with by using [drat](dirk.eddelbuettel.com/code/drat.html)
facilities as described
[here](http://eddelbuettel.github.io/drat/DratForPackageUsers.html):

``` r
drat::addRepo("mbojan")
install.packages("travispkg")
```

or simply:

``` r
install.packages("travispkg", repos="https://mbojan.github.io/drat")
```
