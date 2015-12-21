FROM debian:jessie

MAINTAINER Kristian Larsson <kristian@spritelink.net>

RUN apt-get update -qy && apt-get upgrade -qy \
 && apt-get install -qy bind9 \
    ruby \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN gem install tiller

WORKDIR /root

# copy root hint file
COPY named.root /etc/bind/db.root
# copy template + gen-config script
COPY named.conf.options.in .
COPY gen-config.py .
# copy entrypoint
COPY entrypoint.sh .

EXPOSE 53/udp 53
ENTRYPOINT ["./entrypoint.sh"]
