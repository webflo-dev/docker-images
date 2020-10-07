#!/bin/bash

DOCKER_BUILDKIT=1 docker build --no-cache -t webflo/traefik:2.2 $(dirname "$0")