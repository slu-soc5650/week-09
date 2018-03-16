Lecture 09 Notebook
================
Christopher Prener, Ph.D.
(March 16, 2018)

Introduction
------------

This is the lecture notebook for Lecture-09 from the course SOC 4650/5650: Introduction to GISc.

Load Dependencies
-----------------

The following code loads the package dependencies for our analysis:

``` r
library(dplyr) # data wrangling
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(sf)    # spatial data tools
```

    ## Linking to GEOS 3.6.1, GDAL 2.1.3, proj.4 4.9.3

Load Data
---------

We'll use two data sets from the `stlData` package to practice table joins: census tract geometric data and asthma rate tabular data. Both are added here:

``` r
library(stlData)
tracts <- stl_sf_tracts
asthma <- stl_tbl_asthma
```

Table Joins
-----------

### Data Exploration

Before we undertake a table join, we need to make sure we have two identically *formatted* identification variables. We also need to note whether or not they are identically *named*. We'll start by printing the `tracts` object:

``` r
tracts
```

    ## Simple feature collection with 106 features and 12 fields
    ## geometry type:  POLYGON
    ## dimension:      XY
    ## bbox:           xmin: -90.32052 ymin: 38.53185 xmax: -90.16657 ymax: 38.77443
    ## epsg (SRID):    4269
    ## proj4string:    +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs
    ## First 10 features:
    ##     STATEFP COUNTYFP TRACTCE       GEOID NAME          NAMELSAD MTFCC
    ## 313      29      510  112100 29510112100 1121 Census Tract 1121 G5020
    ## 314      29      510  116500 29510116500 1165 Census Tract 1165 G5020
    ## 324      29      510  110300 29510110300 1103 Census Tract 1103 G5020
    ## 536      29      510  103700 29510103700 1037 Census Tract 1037 G5020
    ## 537      29      510  103800 29510103800 1038 Census Tract 1038 G5020
    ## 538      29      510  104500 29510104500 1045 Census Tract 1045 G5020
    ## 539      29      510  106100 29510106100 1061 Census Tract 1061 G5020
    ## 543      29      510  105500 29510105500 1055 Census Tract 1055 G5020
    ## 545      29      510  105200 29510105200 1052 Census Tract 1052 G5020
    ## 546      29      510  105300 29510105300 1053 Census Tract 1053 G5020
    ##     FUNCSTAT   ALAND AWATER    INTPTLAT     INTPTLON
    ## 313        S 6936664      0 +38.6404148 -090.2820814
    ## 314        S  904024      0 +38.6011802 -090.2372612
    ## 324        S  938287      0 +38.6650436 -090.2324067
    ## 536        S  910953      0 +38.6080393 -090.2918865
    ## 537        S 1640334  35369 +38.5978485 -090.3091337
    ## 538        S 1939712      0 +38.6265570 -090.2808684
    ## 539        S  962321      0 +38.6693968 -090.2811551
    ## 543        S 1195555      0 +38.6600290 -090.2769758
    ## 545        S  831271      0 +38.6505556 -090.2888139
    ## 546        S  958213      0 +38.6575904 -090.2883021
    ##                           geometry
    ## 313 POLYGON ((-90.30445 38.6328...
    ## 314 POLYGON ((-90.24302 38.5975...
    ## 324 POLYGON ((-90.24032 38.6643...
    ## 536 POLYGON ((-90.29877 38.6028...
    ## 537 POLYGON ((-90.32052 38.5941...
    ## 538 POLYGON ((-90.29432 38.6209...
    ## 539 POLYGON ((-90.29005 38.6705...
    ## 543 POLYGON ((-90.28601 38.6589...
    ## 545 POLYGON ((-90.29481 38.6473...
    ## 546 POLYGON ((-90.29705 38.6617...

The `GEOID` variable is present in all census data and in *most* data sets that are meant to correspond to census geography (this is generally true but I have seen exceptions where the `GEOID` variable needs to be constructed by the researcher). Let's assess what type of variable format it has:

``` r
class(tracts$GEOID)
```

    ## [1] "character"

The output from `class()` tells us that it is a character variable. We could also visually assess this by pulling down the `tract` object in our global environment tab and looking for the `GEOID` variable. After the colon next to it will be an indicator of the type of data the variable contains. In this case we see `chr`, meaning it contains character data. This is sometimes impractical in large data sets, however. We can also use `dplyr`'s `glimpse()` function to get similar output:

``` r
glimpse(tracts)
```

    ## Observations: 106
    ## Variables: 13
    ## $ STATEFP  <chr> "29", "29", "29", "29", "29", "29", "29", "29", "29",...
    ## $ COUNTYFP <chr> "510", "510", "510", "510", "510", "510", "510", "510...
    ## $ TRACTCE  <chr> "112100", "116500", "110300", "103700", "103800", "10...
    ## $ GEOID    <chr> "29510112100", "29510116500", "29510110300", "2951010...
    ## $ NAME     <chr> "1121", "1165", "1103", "1037", "1038", "1045", "1061...
    ## $ NAMELSAD <chr> "Census Tract 1121", "Census Tract 1165", "Census Tra...
    ## $ MTFCC    <chr> "G5020", "G5020", "G5020", "G5020", "G5020", "G5020",...
    ## $ FUNCSTAT <chr> "S", "S", "S", "S", "S", "S", "S", "S", "S", "S", "S"...
    ## $ ALAND    <chr> "6936664", "904024", "938287", "910953", "1640334", "...
    ## $ AWATER   <chr> "0", "0", "0", "0", "35369", "0", "0", "0", "0", "0",...
    ## $ INTPTLAT <chr> "+38.6404148", "+38.6011802", "+38.6650436", "+38.608...
    ## $ INTPTLON <chr> "-090.2820814", "-090.2372612", "-090.2324067", "-090...
    ## $ geometry <sf_geometry [degree]> POLYGON ((-90.30445 38.6328..., POLY...

With `glimpse()`, we are looking for column after the variable name. In this case, we know we have character data because we see `<chr>` after the variable name.

Now lets explore the `asthma` object:

``` r
asthma
```

    ## # A tibble: 106 x 6
    ##    geoID       tractCE nameLSAD     pctAsthma pctAsthma_Low pctAsthma_High
    ##    <chr>         <int> <chr>            <dbl>         <dbl>          <dbl>
    ##  1 29510118100  118100 Census Trac…     11.9          11.1           12.7 
    ##  2 29510117400  117400 Census Trac…      9.60          9.30          10.0 
    ##  3 29510126700  126700 Census Trac…     14.5          13.5           15.5 
    ##  4 29510119102  119102 Census Trac…      9.00          8.50           9.70
    ##  5 29510126800  126800 Census Trac…      9.30          8.80           9.80
    ##  6 29510126900  126900 Census Trac…     13.6          12.6           14.6 
    ##  7 29510108100  108100 Census Trac…     12.7          11.8           13.8 
    ##  8 29510127000  127000 Census Trac…     12.8          11.7           14.2 
    ##  9 29510127400  127400 Census Trac…     12.7          11.9           13.8 
    ## 10 29510103700  103700 Census Trac…      8.60          8.10           9.20
    ## # ... with 96 more rows

The `asthma` object has a *similarly* named variable `geoID` that contains the same FIPS code data as `GEOID` in `tract`. We'll use this variable for our table join. We need to make sure it is also character data. We can assess this using the same tools we've already discussed. For simplicity, I'll use `class()` here:

``` r
class(asthma$geoID)
```

    ## [1] "character"

This confirms that we have character data as well. If it came back as numeric data, the following code would allow us to convert it to character:

``` r
asthma <- mutate(asthma, geoID = as.character(geoID))
```

Similarly, we could convert it to numeric (assuming there were not letters or special characters in the values) using:

``` r
asthma <- mutate(asthma, geoID = as.numeric(geoID))
```

### Performing the Join

Now that we know we can complete the join, we'll use `dplyr`'s `left_join()` function:

``` r
asthma_sf <- left_join(x = tracts, y = asthma, by = c("GEOID" = "geoID"))
```

We can explore how the data have changed using `glimpse()`:

``` r
glimpse(asthma_sf)
```

    ## Observations: 106
    ## Variables: 18
    ## $ STATEFP        <chr> "29", "29", "29", "29", "29", "29", "29", "29",...
    ## $ COUNTYFP       <chr> "510", "510", "510", "510", "510", "510", "510"...
    ## $ TRACTCE        <chr> "112100", "116500", "110300", "103700", "103800...
    ## $ GEOID          <chr> "29510112100", "29510116500", "29510110300", "2...
    ## $ NAME           <chr> "1121", "1165", "1103", "1037", "1038", "1045",...
    ## $ NAMELSAD       <chr> "Census Tract 1121", "Census Tract 1165", "Cens...
    ## $ MTFCC          <chr> "G5020", "G5020", "G5020", "G5020", "G5020", "G...
    ## $ FUNCSTAT       <chr> "S", "S", "S", "S", "S", "S", "S", "S", "S", "S...
    ## $ ALAND          <chr> "6936664", "904024", "938287", "910953", "16403...
    ## $ AWATER         <chr> "0", "0", "0", "0", "35369", "0", "0", "0", "0"...
    ## $ INTPTLAT       <chr> "+38.6404148", "+38.6011802", "+38.6650436", "+...
    ## $ INTPTLON       <chr> "-090.2820814", "-090.2372612", "-090.2324067",...
    ## $ tractCE        <int> 112100, 116500, 110300, 103700, 103800, 104500,...
    ## $ nameLSAD       <chr> "Census Tract 1121", "Census Tract 1165", "Cens...
    ## $ pctAsthma      <dbl> 8.8, 10.8, 13.0, 8.6, 9.1, 8.8, 14.6, 12.3, 10....
    ## $ pctAsthma_Low  <dbl> 8.4, 10.2, 12.2, 8.1, 8.5, 8.4, 13.4, 11.6, 9.5...
    ## $ pctAsthma_High <dbl> 9.3, 11.5, 13.9, 9.2, 9.6, 9.3, 15.9, 13.2, 10....
    ## $ geometry       <sf_geometry [degree]> POLYGON ((-90.30445 38.6328......

The variables from `tract` appear first because `tract` was the `x` table in our `left_join()`, and the variables from `asthma` appear second because it was the `y` variable. Note that `GEOID` only appears once.

If both `tract` and `asthma` had identically named `GEOID` variables, we could have used this simplified syntax:

``` r
asthma_sf <- left_join(x = tract, y = asthma, by = "GEOID")
```
