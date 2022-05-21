#!/bin/bash
cd /var/varnish
./buildVcl.sh > /etc/varnish/conf.d/varnish.vcl
while true; do sleep 10000; done

