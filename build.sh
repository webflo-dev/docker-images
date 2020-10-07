#!/bin/bash

for f in *; do
  if [ -d ${f} ]; then
    if [ -f "$f/build.sh" ]; then
      $f/build.sh
    fi
  fi
done