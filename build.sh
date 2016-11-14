#!/bin/bash

script_dir="`cd $(dirname $0); pwd`"
docker build -t dockcross/cxx-write-once-run-anywhere $script_dir
