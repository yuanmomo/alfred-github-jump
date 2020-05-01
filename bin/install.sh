#!/usr/bin/env bash

current_dir=$(cd "$(dirname "$0")";pwd)
root_dir=${current_dir}/..

cd ${root_dir}
make build && make package && ls|grep -i  alfredworkflow |/usr/local/bin/gxargs open


