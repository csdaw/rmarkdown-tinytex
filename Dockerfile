ARG R
ARG BUILD_DATE
ARG VCS_REF

FROM rocker/r-ver:$R

LABEL maintainer="Charlotte Dawson <csdaw@outlook.com>" \
      org.opencontainers.image.authors="Charlotte Dawson" \
      author.orcid="0000-0002-7151-5971" \
      org.opencontainers.image.url="https://hub.docker.com/repository/docker/csdaw/rmarkdown-tinytex" \
      org.label-schema.vcs-url="https://github.com/csdaw/rmarkdown-tinytex" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.license="MIT"

# install tinytex linux dependencies, pandoc, and rmarkdown
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    wget \
    graphviz \
    perl && \
    /rocker_scripts/install_pandoc.sh && \
    install2.r rmarkdown

# install tinytex
RUN Rscript -e 'tinytex::install_tinytex()'
