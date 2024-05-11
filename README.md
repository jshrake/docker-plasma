# docker-plasma [![ci](https://github.com/jshrake/docker-plasma/actions/workflows/main.yaml/badge.svg)](https://github.com/jshrake/docker-plasma/actions/workflows/main.yaml)


- **plasma-pool-tcp-server**:      [![Docker Image Size](https://badgen.net/docker/size/jshrake/plasma-pool-tcp-server?icon=docker&label=image%20size)](https://hub.docker.com/r/jshrake/plasma-pool-tcp-server/)
- **plasma-pool-zeroconf-server**: [![Docker Image Size](https://badgen.net/docker/size/jshrake/plasma-pool-zeroconf-server?icon=docker&label=image%20size)](https://hub.docker.com/r/jshrake/plasma-pool-zeroconf-server/)

---

Docker images and compose file for [plasma](https://github.com/zeugma-hamper/plasma). Specificaly for [pool-tcp-server](https://github.com/zeugma-hamper/plasma/blob/iz/libPlasma/c/pool_tcp_server.c) and [pool-server-zeroconf-adapter](https://github.com/zeugma-hamper/plasma/blob/iz/libPlasma/zeroconf/pool-server-zeroconf-adapter.cpp). Everything you need to run a pool tcp server that is zeroconf announced on your local network!

```console
just build
docker compose up
```

Note that the pool-zeroconf-server container needs to run on a host system that is running avahi-daemon, and the files `/var/run/dbus` and `/var/run/avahi-daemon/socket` need to be volume mounted into the container. See [compose.yaml](compose.yaml) for all the details. Given all of this, you wont be able to run the pool-zeroconf-server container on MacOS.

To install avahi-daemon:

```console
sudo apt install avahi-daemon 
sudo systemctl enable avahi-daemon
sudo systemctl status avahi-daemon
```

Additionally, all the plasma command-line tools are available in the plasma container and you can run them like:

```console
p() { docker run -it --network host --entrypoint "p-$1" jshrake/plasma:latest "${@:2}"; }
p create tcp://localhost/test
p info tcp://localhost/test
p deposit tcp://localhost/test -d hello -i name:world
p await tcp://localhost/test
```
