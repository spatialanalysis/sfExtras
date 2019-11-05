
<!-- README.md is generated from README.Rmd. Please edit that file -->

# sfExtras

<!-- badges: start -->

<!-- badges: end -->

The goal of sfExtras is to provide a nice interface to sf-style
functions for spatial autocorrelation functionality in R. This package
was developed for the R Spatial Workshop at the [Center for Spatial Data
Science](https://spatial.uchicago.edu/) at the University of Chicago.
The code in this package originates from documentation from
[sf](https://github.com/r-spatial/sf) and
[spdep](https://github.com/r-spatial/spdep). The goal is to create a
nice function API interface for spatial analysts to use with the sf and
spdep packages.

**Disclaimer**: This package is still heavily under development, so use
at your own risk. PRs and issues are welcome.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("spatialanalysis/sfExtras")
```

## Example

Load the sfExtras library, then start making contiguity weights:

``` r
library(sf)
```

    ## Linking to GEOS 3.7.2, GDAL 2.4.2, PROJ 5.2.0

``` r
library(sfExtras)
library(geodaData)

ncovr_rook <- st_rook(ncovr)
```

    ## although coordinates are longitude/latitude, st_relate_pattern assumes that they are planar

``` r
ncovr_queen <- st_queen(ncovr)
```

    ## although coordinates are longitude/latitude, st_relate_pattern assumes that they are planar

Convert into **nb** class for use with the spdep package:

``` r
rook_nb <- st_as_nb(ncovr_rook)
```
