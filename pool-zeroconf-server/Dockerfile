FROM plasma

# Final image stage
FROM ubuntu:22.04
ENV PLASMA_ZERCONF_POOL_SERVER="tcp://localhost:65456"
# Install necessary libraries
RUN apt-get update && apt-get install -y --no-install-recommends \
    libssl3 \
    libyaml-0-2 \
    libicu70 \
    libavahi-common3 \
    libavahi-client3 \
    && rm -rf /var/lib/apt/lists/*

# Copy the pool_tcp_server binary from the builder stage
COPY --from=0 /plasma/build/libPlasma/zeroconf/pool-server-zeroconf-adapter /usr/bin/pool-server-zeroconf-adapter 

# Set the entry point for the container
ENTRYPOINT /usr/bin/pool-server-zeroconf-adapter -n -v ${PLASMA_ZERCONF_POOL_SERVER}