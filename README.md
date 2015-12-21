BIND resolver (with DNSSEC) + ExaBGP
====================================

BIND resolver (with DNSSEC) + ExaBGP in a docker container for your enjoyment!

This container runs BIND set up as a resolver. It listens on both IPv4 and IPv6.

**NOTE**: This thing doesn't speak BGP just yet....

Rate limiting
-------------
Queries are rate limited using BIND's RRL functionality. The
responses-per-second is set to 10 which means that clients are limited to 10
identical (query name and type) queries per second, which is fairly high. RRL
stats are kept per IPv4 host (/32) and per /56 subnet for IPv6, i.e. it is
assumed that each customer has a /56 and their own IPv4 address. If customers
are given some other IPv6 prefix length than /56 or if multiple clients share
the same IPv4 address (such as through NAT) then you might want to tweak these
settings. The table size config is optimized for running this thing in a large
scale deployment with a maximum of 16 million entries (consuming roughly
1.3GB).


Running
-------
Run the container with the following. GOODCLIENTS specify which networks clients are allowed to query from.

```docker run --name resolver -d -p 53:53/udp -p 53:53 -e "GOODCLIENTS=192.168.1.0/24;" plajjan/bind-bgp-resolver```


Configuration
-------------
- **GOODCLIENTS**: List of clients (networks) that are allowed to use the resolved. Use semicolons to separate multiple entries. Should always end with semicolon, even with only one entry
