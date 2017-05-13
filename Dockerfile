#
# Python Dockerfile
#
# https://github.com/dockerfile/python
#

# Pull base image.
FROM ubuntu

# Install Python.
RUN \
  apt-get update && \
  apt-get install -y \
     python \
     git \
     wget \
     python-dev \
     python-pip \
     python-virtualenv \
     r-base-core \
     r-base-dev \
     r-cran-ggplot2 \
     r-cran-gplots \
     r-cran-rcolorbrewer \
     r-cran-plotrix \
     r-bioc-limma \
     x11-utils \
     && rm -rf /var/lib/apt/lists/*

# Define working directory.
WORKDIR /data

RUN \
  git clone https://github.com/FJD-CEPH/aCNViewer.git

ENV LD_LIBRARY_PATH=HDZR

RUN \
  python aCNViewer/code/aCNViewer.py -P installDependencies

# Define default command.
#CMD ["python", "aCNViewer/code/aCNViewer.py"]
ENTRYPOINT ["python", "aCNViewer/code/aCNViewer.py"]
#CMD ["bash"]
