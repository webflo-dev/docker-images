#!/bin/bash

DOCKER_BUILDKIT=1 docker build --no-cache -t webflo/ubuntu-user $(dirname "$0")