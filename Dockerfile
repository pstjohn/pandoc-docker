FROM jagregory/pandoc:latest

MAINTAINER Peter St. John <peter.stjohn@nrel.gov>

# install pandoc filters, inkscape and other tools
RUN apt-get update -y \
  && apt-get install -y --no-install-recommends \
    texlive-extra-utils \
    inkscape \
    bibtool \
    latexmk \
    lmodern \
  && cabal update && \ 
     cabal install pandoc && \
     cabal install pandoc-citeproc && \
     cabal install pandoc-crossref

# Add pandoc to the image path
ENV PATH root/.cabal/bin:$PATH

ENTRYPOINT []
CMD ["pandoc"]
