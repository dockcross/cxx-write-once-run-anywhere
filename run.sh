#!/bin/sh

docker run \
  --rm \
  -p 8888:8888 \
  -v $PWD:/home/jovyan/work/ \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e GRANT_SUDO=yes \
  --user root \
  dockcross/cxx-write-once-run-anywhere
