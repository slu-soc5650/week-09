lecture-09 <img src="https://slu-soc5650.github.io/images/logo.png" align="right" />
===========================================================
[![](https://img.shields.io/badge/semester-spring%202018-orange.svg)](https://github.com/slu-soc5650/lecture-09)
[![](https://img.shields.io/badge/release-full-brightgreen.svg)](https://github.com/slu-soc5650/lecture-09)
[![](https://img.shields.io/github/release/slu-soc5650/lecture-09.svg?label=version)](https://github.com/slu-soc5650/lecture-09/releases)
[![](https://img.shields.io/github/last-commit/slu-soc5650/lecture-09.svg)](https://github.com/slu-soc5650/lecture-09/commits/master)
[![](https://img.shields.io/github/repo-size/slu-soc5650/lecture-09.svg)](https://github.com/slu-soc5650/lecture-09)
[![Travis-CI Build Status](https://travis-ci.org/slu-soc5650/lecture-09.svg?branch=master)](https://travis-ci.org/slu-soc5650/lecture-09)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/slu-soc5650/lecture-09?branch=master&svg=true)](https://ci.appveyor.com/project/chris-prener/lecture-09)

This is the repository for Lecture 09 of the Saint Louis University course SOC 4650/5650 - Introduction to GIS. This lecture covers techniques for for table joins using R and spatial joins using ArcGIS.

### Lecture Objectives
At the end of this lecture and its corresponding assignments, students should be able to:

1. Distinguish between table and spatial joins
2. Use `dplyr` to complete table joins in `R`
3. Compose `R` notebooks that import multiple data sets, appropriately combine them, and then export them in the proper format.
4. Distinguish between different types of spatial joins
5. Use ArcMap to complete spatial joins
6. Use ArcMap to calculate and project the centroids

### Lecture Resources

* The [lecture webpage](https://slu-soc5650.github.io/lecture-09) contains links to resources as well as the corresponding videos for this lecture
* The [`SETUP.md`](/references/SETUP.md) file in the [`references/`](/references) directory contains a list of packages required for this lecture
* The [`references/`](/references) directory also contains other notes on changes to the repository, key topics, terms, data sources, and software. Some of this information is a duplicate of material on the course website.
* The [`data/`](/data) directory contains additional data for the lab and the problem set, see [`NEWS`](/references/DATA.md) for descriptions of each file.
* The `assignments/` directory contains instructions for both Lab 08 and Lecture Prep 08 as well as the replication files for the Lab.

### Extra Materials
The following are extra materials that go further on particular topics. They are **not required** for students enrolled in this course, but they provide additional materials for those who are interested.

* The [`extras/`](/extras) directory contains some examples of processes for completing spatial joins in `R` using the `sf` and `dplyr` packages. 
* There is also a short notebook in [`extras/`](/extras) that illustrates the steps for calculating polygon centroids in `R` using the `sf` package.

### Access Lecture
Students in my course should clone this repository into their course folder system. Others can quickly download this lecture to their `Desktop` using `usethis`:

```r
usethis::use_course("https://github.com/slu-soc5650/lecture-09/archive/master.zip")
```

### Support and Feedback
Students currently enrolled in this course should seek assistance on Slack and/or during in-person office hours before posting questions or reporting possible bugs. Others should see my general policy on [support](.github/SUPPORT.md). If you have found a typo or have a suggestion, please check the [contribution guidelines](.github/CONTRIBUTING.md) guidelines before opening an issue. Please note that contributions to this project are governed by a [Contributor Code of Conduct](.github/CODE_OF_CONDUCT.md) and, for Saint Louis University community members, our various University policies.

### Additional Materials
Source `.tex` files for the handouts and assignments for this lecture are available in the [`lecture-09-resources` repository](https://github.com/slu-soc5650/lecture-09-resources). These are intended for instructors who wish to use course materials with attribution and for my students who are moving on to present and teach about these topics.

## About SOC 4650 & 5650: Introduction to GIS
### Course Description
This class introduces both the theoretical and technical skills that constitute the nascent field of Geographic Information Science (GISc). Techniques introduced include data cleaning and management, map production and cartography, and the manipulation of both tabular and spatial data. The impacts of GISc on public policy, and the effects of public policy on GISc, are also discussed. The course incorporates a wide variety of social, economic, health, urban, meteorological, and environmental data. These data are mapped at a variety of extents, from the City of St. Louis to the St. Louis Metropolitan region, Missouri, all United States counties, and all U.S. states. More details are available on the [course website](https://slu-soc5650.github.io).

### About Christopher Prener, Ph.D.
Chris is an urban and medical sociologist with an interest in mixed methods research designs that incorporate spatial data. His dissertation examined the effect of neighborhood context and conditions on emergency medical services work, particularly with patients who have mental illnesses or substance use disorders. He is also part of a research team examining the effects of literacy on mental health service use and recovery, and his student research team is documenting the effects of systemic street closures in St. Louis. He is an Assistant Professor in the Department of Sociology and Anthropology at Saint Louis University. More details are available at [his website](https://chris-prener.github.io) and he can be contacted at [chris.prener@slu.edu](mailto:chris.prener@slu.edu).

### About Saint Louis University <img src="https://slu-soc5650.github.io/images/sluLogo.png" align="right" />
Founded in 1818, [Saint Louis University](http://wwww.slu.edu) is one of the nation’s oldest and most prestigious Catholic institutions. Rooted in Jesuit values and its pioneering history as the first university west of the Mississippi River, SLU offers nearly 13,000 students a rigorous, transformative education of the whole person. At the core of the University’s diverse community of scholars is SLU’s service-focused mission, which challenges and prepares students to make the world a better, more just place.
