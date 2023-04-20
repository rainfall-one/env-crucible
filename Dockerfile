FROM --platform=$TARGETPLATFORM debian:stable-slim
LABEL org.opencontainers.image.authors="rajesh@rainfall.one"

    # Dependencies
  RUN apt-get update -y
  RUN apt-get install -y build-essential wget 
  RUN apt-get install -y gnupg ca-certificates software-properties-common
  RUN apt-get install -y git  libvulkan-dev libssl-dev libx11-dev zlib1g-dev libxext-dev

  RUN cd /tmp && git clone https://gitlab.kitware.com/cmake/cmake.git 
  RUN cd /tmp/cmake && ./bootstrap && make -j $(nproc) && make install
