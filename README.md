rmarkdown-tinytex
================

A minimal docker image for knitting R Markdown documents. I use this image as 
the base for the Dockerfiles in my reproducible research projects.

Includes:

- base R (uses [rocker/r-ver](https://hub.docker.com/r/rocker/r-ver/))
- pandoc
- rmarkdown and dependencies
- tinytex

## Build image

```bash
docker build . -t rmarkdown-tinytex --build-arg R=4.0.2
```

## Run container and knit test document automatically

```bash
cd # to wherever this folder is
docker run --rm -v $PWD:/home -w /home csdaw/rmarkdown-tinytex \
  Rscript -e 'rmarkdown::render("test.Rmd")'
```

## Run container and knit test document interactively

```bash
cd # to wherever this folder is
docker run --rm -it -v $PWD:/home -w /home csdaw/rmarkdown-tinytex R
```

```r 
rmarkdown::render("test.Rmd")
```
