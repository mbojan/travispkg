#!/usr/bin/env sh

set -ev

choco install -y zip pandoc Rtools

export PATH='/c/Rtools/bin:/c/Rtools/mingw_64/bin':$PATH

choco install -y r.project &&
export R_VERSION=`ls 'C:\Program Files\R\'` &&
export PATH=$PATH:'/c/Program Files/R/'$R_VERSION'/bin/x64' &&
echo 'options(repos = "https://cloud.r-project.org", install.packages.compile.from.source = "never")' > ~/.Rprofile.site &&
export R_PROFILE=~/.Rprofile.site &&

Rscript.exe -e 'sessionInfo()' &&
Rscript.exe -e 'install.packages("devtools", dependencies = TRUE);if (!all("devtools" %in% installed.packages())) { q(status = 1, save = "no")}' &&
Rscript.exe -e 'deps <- devtools::dev_package_deps(dependencies = TRUE); inst <- installed.packages(); install.packages(deps$package[!deps$package %in% inst[,"Package"]])' &&
Rscript.exe -e 'install.packages("zeallot", dependencies = TRUE)' &&
Rscript.exe -e 'devtools::session_info(installed.packages()[, "Package"])'
