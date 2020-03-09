FROM debian:buster as base

FROM base as builder

COPY . /opt/
RUN apt-get update && apt-get install -y \
    cmake \
    automake \
    autoconf \
    libtool \
    git \
    libboost1.67-dev \
    libboost-system1.67-dev \
    libboost-thread1.67-dev \
    libboost-program-options1.67-dev \
    libboost-filesystem1.67-dev \
    build-essential

RUN git clone --depth=1 https://github.com/martinling/libserialport ; \
    cd libserialport \
    && ./autogen.sh  \
    && ./configure \
    && make \ 
    && make install 

RUN git clone --depth=1 https://github.com/zaphoyd/websocketpp ; \
    cd websocketpp \
    && mkdir build; cd build \
    && cmake .. \
    && make install

RUN cd /opt/Flotilla \
    && make \
    && cp Debug/flotilla /usr/local/bin/

FROM base
COPY --from=builder /usr/local /usr/local
RUN apt-get update \
    && apt-get install -y \
        libboost1.67 \
        libboost-system1.67 \
        libboost-thread1.67 \
        libboost-program-options1.67 \
        libboost-filesystem1.67 \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 9395
CMD ["flotilla", "-d", "-v"]
