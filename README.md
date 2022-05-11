# Gentoo stage3 Docker Image for Testing Java Packages

This repository contains a `Dockerfile` that can be used to build a Docker
image based on [`gentoo/stage3:latest`][gentoo-stage3] with common dependencies
of many Java packages pre-installed.

[gentoo-stage3]: https://hub.docker.com/r/gentoo/stage3

## Installed Packages

- `dev-java/openjdk-bin:11` (Selected as the system VM)
- `dev-java/openjdk-bin:8`
- `dev-java/junit:4`
- `dev-java/testng`
- `dev-util/pkgdiff`
- `def-util/japi-compliance-checker`

## Building This Image

The following tools are supported for building this image from the
`Dockerfile`:

- [Buildah](https://buildah.io/)
- [Podman](https://podman.io/)

Once at least one of the above tools has been installed, run the corresponding
build script in this repository, with the working directory being the root of
this repository's working tree, to begin the build process:

- Buildah: `./buildah-build.sh`
- Podman: `./podman-build.sh`

By modifying the `Dockerfile`, this image can be built in different ways.  For
more information, please refer to the [`Dockerfile` reference][dockerfile] in
Docker Documentation.

[dockerfile]: https://docs.docker.com/engine/reference/builder/

### Why Is Docker Not Supported?

Because neither `docker build` nor `docker buildx build` supports the
[`--cap-add`][docker-run-linux-cap] and
[`--security-opt`][docker-run-security-opt] options.  Without these options,
the temporary container created to build the image cannot be granted the
privileges required by certain packages; as a result, these packages would fail
to install in the container.

On the other hand, Buildah and `podman build` support these options, which is
why they can be used to build this image.

[docker-run-linux-cap]: https://docs.docker.com/engine/reference/run/#runtime-privilege-and-linux-capabilities
[docker-run-security-opt]: https://docs.docker.com/engine/reference/run/#security-configuration

## Pre-built Image

This image is being built with the latest `gentoo/stage3` image and published
[to GitHub's Container registry][ghcr-image] automatically every day.  The
process is handled by [a GitHub Actions workflow][workflow].

[ghcr-image]: https://github.com/Leo3418/gentoo-java-image/pkgs/container/gentoo-stage3-amd64-java
[workflow]: https://github.com/Leo3418/gentoo-java-image/actions/workflows/publish.yml
