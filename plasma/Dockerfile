# Use an official base image with build tools installed
FROM ubuntu:22.04

# Install necessary packages
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    ninja-build \
    cmake \
    libyaml-dev \
    libboost-all-dev \
    libicu-dev \
    libssl-dev \
    libavahi-client-dev \
    && rm -rf /var/lib/apt/lists/*

# Clone the repository
RUN git clone https://github.com/zeugma-hamper/plasma /plasma

# Build the project
WORKDIR /plasma
RUN cmake -B build -G Ninja
RUN cmake --build build --config Release
ENV PATH="${PATH}:/plasma/build/libPlasma/c"