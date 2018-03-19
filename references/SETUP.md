# lecture-09 Setup
The following packages are required for this lecture. See the [package index](https://slu-soc5650.github.io/package-index/) for cross referencing these packages with other parts of the course.

### `tidyverse`

* `dplyr` - data wrangling
* `ggplot2` - plotting
    * this lecture uses the **development** version, which should be installed using `devtools` - see the [course website](https://slu-soc5650.github.io/course-software/) for additional details
* `readr` - reading and writing `.csv` files

### Spatial Data
* `sf` - spatial data tools
    * using `sf` requires additional dependencies - see the [course website](https://slu-soc5650.github.io/course-software/) for additional details
* `stlData` - example data about the St. Louis area
    * not available on CRAN, install from [GitHub](https://github.com/chris-prener/stlDatas)

### Design
* `ggthemes` - `ggplot2` themes
* `RColorBrewer` - color palettes
* `viridis` - color palettes

### Literate Programming
* `knitr` - create documents from R notebooks
* `rmarkdown` - write in Markdown syntax

### Project Organization
* `here` - manage file paths

## Optional Packages
In addition to the packages listed above, `assertthat` is used in the extra notebook that illustrates spatial joins.
