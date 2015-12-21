BIND resolver (with DNSSEC) + ExaBGP
====================================

BIND resolver (with DNSSEC) + ExaBGP in a docker container for your enjoyment!

This container runs BIND set up as a resolver. It listens on both IPv4 and IPv6.

**NOTE**: This thing doesn't speak BGP just yet....

Running
-------
Run the container with the following. GOODCLIENTS specify which networks clients are allowed to query from.

```docker run --name resolver -d -p 53:53/udp -p 53:53 -e "GOODCLIENTS=192.168.1.0/24;" plajjan/bind-bgp-resolver```


Configuration
-------------
- **GOODCLIENTS**: List of clients (networks) that are allowed to use the resolved. Use semicolons to separate multiple entries. Should always end with semicolon, even with only one entry
