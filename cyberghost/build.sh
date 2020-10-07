#!/bin/bash

DOCKER_BUILDKIT=1 docker build --no-cache -t webflo/cyberghost:1.3.3 $(dirname "$0")
