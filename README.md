
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
available.packages(repos="https://mbojan.github.io/drat")
#>                   Package             Version Priority Depends        Imports
#> akademiaanalityka "akademiaanalityka" "1.0"   NA       "R (>= 3.2.0)" NA     
#> alluvial          "alluvial"          "0.1-0" NA       NA             NA     
#> travispkg         "travispkg"         "1.0-0" NA       NA             NA     
#>                   LinkingTo Suggests                       Enhances License
#> akademiaanalityka NA        "devtools, testthat"           NA       "GPL-2"
#> alluvial          NA        "devtools, testthat, reshape2" NA       "GPL-3"
#> travispkg         NA        "testthat (>= 2.1.0)"          NA       "GPL-2"
#>                   License_is_FOSS License_restricts_use OS_type Archs
#> akademiaanalityka NA              NA                    NA      NA   
#> alluvial          NA              NA                    NA      NA   
#> travispkg         NA              NA                    NA      NA   
#>                   MD5sum                             NeedsCompilation File
#> akademiaanalityka "0684cdcce1c1c8fe36bf93c5542948f9" "no"             NA  
#> alluvial          "d7ff9be69b80c635d3e638f1e82ca6d5" "no"             NA  
#> travispkg         "8f67a484e93a8d333b084ea209f010c6" "no"             NA  
#>                   Repository                                 
#> akademiaanalityka "https://mbojan.github.io/drat/src/contrib"
#> alluvial          "https://mbojan.github.io/drat/src/contrib"
#> travispkg         "https://mbojan.github.io/drat/src/contrib"
available.packages(repos="https://mbojan.github.io/drat", type="win.binary")
#>           Package     Version Priority Depends       
#> netflow   "netflow"   "0.0-1" NA       "R (>= 3.5)"  
#> rgraph6   "rgraph6"   "2.0-0" NA       "R (>= 2.2.1)"
#> travispkg "travispkg" "1.0-0" NA       NA            
#>           Imports                                  LinkingTo
#> netflow   "igraph, magrittr, dplyr, rlang, tibble" NA       
#> rgraph6   NA                                       NA       
#> travispkg NA                                       NA       
#>           Suggests                                      Enhances
#> netflow   "testthat, DBI, igraphdata, RSQLite, dbplyr"  NA      
#> rgraph6   "testthat, knitr, rmarkdown, igraph, network" NA      
#> travispkg "testthat (>= 2.1.0)"                         NA      
#>           License              License_is_FOSS License_restricts_use OS_type
#> netflow   "MIT + file LICENSE" NA              NA                    NA     
#> rgraph6   "MIT + file LICENSE" NA              NA                    NA     
#> travispkg "GPL-2"              NA              NA                    NA     
#>           Archs       MD5sum NeedsCompilation File
#> netflow   NA          NA     NA               NA  
#> rgraph6   "i386, x64" NA     NA               NA  
#> travispkg NA          NA     NA               NA  
#>           Repository                                             
#> netflow   "https://mbojan.github.io/drat/bin/windows/contrib/3.6"
#> rgraph6   "https://mbojan.github.io/drat/bin/windows/contrib/3.6"
#> travispkg "https://mbojan.github.io/drat/bin/windows/contrib/3.6"
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
