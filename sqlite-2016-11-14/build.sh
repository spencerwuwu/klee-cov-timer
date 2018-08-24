#!/bin/bash
# Copyright 2016 Google Inc. All Rights Reserved.
# Licensed under the Apache License, Version 2.0 (the "License");
. $(dirname $0)/../common.sh

set -x

$CC $CFLAGS -ldl -lpthread sqlite3.c ossfuzz.c -o klee.out
extract-bc klee.out
