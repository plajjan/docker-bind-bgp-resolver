#!/usr/bin/env python

import os

f = open("named.conf.options.in")
c = f.read()
f.close()

data = {
    'GOODCLIENTS': os.getenv('GOODCLIENTS')
}

w = open("/etc/bind/named.conf.options", "w")
w.write(c % data)
w.close()
