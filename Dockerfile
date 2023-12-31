# Use Ubuntu Bionic as the base image
FROM ubuntu:bionic

RUN apt update \
    && apt -y install -qq git cmake autotools-dev libopenjp2-7-dev libtiff5-dev libpng-dev libgif-dev libxt-dev autoconf automake libtool bzip2 libxml2-dev libuninameslist-dev libspiro-dev python-dev libpango1.0-dev libcairo-dev chrpath uuid-dev uthash-dev software-properties-common libpoppler-private-dev libpoppler-glib-dev wget

RUN add-apt-repository ppa:fontforge/fontforge \
    && apt update \
    && apt install -y fontforge libfontforge-dev 

RUN wget https://poppler.freedesktop.org/poppler-0.81.0.tar.xz \
    && tar xvf poppler-0.81.0.tar.xz \
    && cd poppler-0.81.0 \
    && mkdir build \
    && cd build \
    && cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \ 
    -DTESTDATADIR=$PWD/testfiles \ 
    -DENABLE_UNSTABLE_API_ABI_HEADERS=ON \
    .. \
    && make \
    && make install \
    && cd ../..

RUN git clone --depth 1 https://github.com/pdf2htmlEX/pdf2htmlEX.git
RUN apt-get update && apt-get install -y sudo
RUN cd pdf2htmlEX \
    && ./buildScripts/buildInstallLocallyApt

VOLUME /pdf
WORKDIR /pdf

# /usr/local/bin/pdf2htmlEX
CMD ["pdf2htmlEX"]