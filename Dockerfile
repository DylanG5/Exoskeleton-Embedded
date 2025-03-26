FROM debian:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    debhelper \
    dh-make \
    dpkg-dev \
    fakeroot \
    git \
    && apt-get clean

WORKDIR /workspace

CMD ["/bin/bash"]
