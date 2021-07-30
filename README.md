# Gentoo stage3 Docker Image for Testing Java Packages

This repository contains a `Dockerfile` that can be used to build a Docker
image based on [`gentoo/stage3:latest`][gentoo-stage3] with common dependencies
of many Java packages pre-installed.

[gentoo-stage3]: https://hub.docker.com/r/gentoo/stage3

## Installed Packages

- `dev-java/openjdk:8`
- `dev-java/junit:4`
- `dev-java/testng`
- `dev-util/pkgdiff`
- `def-util/japi-compliance-checker`

## Building This Image

Assuming Docker has been installed, the easiest way to build this image from
the `Dockerfile` is to run the following command:

```console
# docker build https://github.com/Leo3418/gentoo-java-image.git
```

By adding extra options to the `docker build` command and/or modifying the
`Dockerfile`, this image can be built in different ways.  For more information,
please refer to the following pages in Docker Documentation:

- [`docker build` command-line reference][docker-build]
- [`Dockerfile` reference][dockerfile]

[docker-build]: https://docs.docker.com/engine/reference/commandline/build/
[dockerfile]: https://docs.docker.com/engine/reference/builder/

## Pre-built Image

This image is being built with the latest `gentoo/stage3` image and published
[to GitHub's Container registry][ghcr-image] automatically every day.  The
process is handled by [a GitHub Actions workflow][workflow].

[ghcr-image]: https://github.com/Leo3418/gentoo-java-image/pkgs/container/gentoo-stage3-amd64-java
[workflow]: https://github.com/Leo3418/gentoo-java-image/actions/workflows/publish.yml
