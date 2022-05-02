FROM rocker/tidyverse:4.2.0
# your renv version
ENV RENV_VERSION=0.15.4
RUN apt-get update
# install any Unix libraries after this, e.g. RUN apt-get update && apt-get install cmake
RUN R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"
WORKDIR /project
COPY renv.lock renv.lock
RUN R -e "renv::restore()"
