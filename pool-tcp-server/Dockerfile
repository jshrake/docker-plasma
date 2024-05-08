FROM plasma

# Final image stage
FROM ubuntu:22.04
ENV PLASMA_POOL_TCP_PORT="65456"
# Install necessary libraries
RUN apt-get update && apt-get install -y --no-install-recommends \
    libssl3 \
    libyaml-0-2 \
    && rm -rf /var/lib/apt/lists/*
# Copy the pool_tcp_server binary from the builder stage
COPY --from=0 /plasma/build/libPlasma/c/pool_tcp_server /usr/bin/pool_tcp_server

# Set the entry point for the container
ENTRYPOINT /usr/bin/pool_tcp_server -n -p ${PLASMA_POOL_TCP_PORT}