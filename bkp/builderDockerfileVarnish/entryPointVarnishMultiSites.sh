#!/bin/bash
cd /var/varnish
./buildVcl.sh > /etc/varnish/conf.d/varnish.vcl
#cd /
#/docker-entrypoint.sh
