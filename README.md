rmarkdown-tinytex
================

[![pulls](https://img.shields.io/docker/pulls/csdaw/rmarkdown-tinytex)](https://hub.docker.com/r/csdaw/rmarkdown-tinytex "Number of pulls from Docker Hub")
![image](https://img.shields.io/docker/image-size/csdaw/rmarkdown-tinytex/latest)
[![dockerfile](https://img.shields.io/badge/dockerfile%20on-github-blue.svg)](https://github.com/csdaw/rmarkdown-tinytex "Dockerfile source repository")
[![base](https://img.shields.io/badge/depends%20on-rocker%2Fr--ver-blue)](https://hub.docker.com/r/rocker/r-ver "Docker base image")
[![license](https://images.microbadger.com/badges/license/csdaw/rmarkdown-tinytex.svg)](https://microbadger.com/images/csdaw/rmarkdown-tinytex "View image on microbadger.com")


A minimal docker image for knitting R Markdown documents. I use this image as 
the base for the Dockerfiles in my reproducible research projects.

Includes:

- base R (uses [rocker/r-ver](https://hub.docker.com/r/rocker/r-ver/))
- pandoc
- rmarkdown and dependencies
- tinytex

## Build image

```bash
# latest R version
docker build . -t rmarkdown-tinytex --build-arg R=latest

# specific R version
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
