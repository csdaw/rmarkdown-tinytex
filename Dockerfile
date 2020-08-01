ARG R

FROM rocker/r-ver:${R}

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    wget \
    graphviz \
    perl && \
    /rocker_scripts/install_pandoc.sh && \
    install2.r rmarkdown

RUN Rscript -e 'tinytex::install_tinytex()'
