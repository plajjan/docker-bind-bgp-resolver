#!/bin/sh

./gen-config.py

exec /usr/sbin/named -u bind -f
