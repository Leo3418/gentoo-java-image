#!/usr/bin/env bash

# Use Podman to build the Docker image from the Dockerfile in this repository.

. .build-args

podman build "${oci_build_args[@]}" .
