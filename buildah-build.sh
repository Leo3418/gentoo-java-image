#!/usr/bin/env bash

# Use Buildah to build the Docker image from the Dockerfile in this repository.

. .build-args

buildah build --format=docker "${oci_build_args[@]}" .
