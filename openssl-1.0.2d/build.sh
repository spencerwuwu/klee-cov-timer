#!/bin/bash
# Copyright 2016 Google Inc. All Rights Reserved.
# Licensed under the Apache License, Version 2.0 (the "License");
. $(dirname $0)/../common.sh

build_lib() {
  rm -rf BUILD
  cp -rf SRC BUILD
  (cd BUILD && CC="$CC $CFLAGS" ./config && make clean && make -j $JOBS)
}

get_git_tag https://github.com/openssl/openssl.git OpenSSL_1_0_2d SRC
#build_lib

export SCRIPT_DIR="./"

set -x
$CC klee.c -DCERT_PATH=\"$SCRIPT_DIR/\"  BUILD/libssl.a BUILD/libcrypto.a -lgcrypt -I BUILD/include -o klee.out
extract-bc klee.out
