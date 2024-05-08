build: pool-tcp-server pool-zeroconf-server

up:
    docker compose up --remove-orphans -d

plasma:
    docker build -t plasma:latest -f plasma/Dockerfile plasma/.

pool-tcp-server: plasma
    docker build -t plasma-pool-tcp-server:latest -f pool-tcp-server/Dockerfile pool-tcp-server/.

pool-zeroconf-server: plasma
    docker build -t plasma-pool-zeroconf-server:latest -f pool-zeroconf-server/Dockerfile pool-zeroconf-server/.