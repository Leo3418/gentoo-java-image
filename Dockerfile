FROM docker.io/gentoo/stage3:latest

ARG ATOMS="\
dev-java/openjdk-bin:11 \
dev-java/openjdk-bin:8 \
dev-java/junit:4 \
dev-java/testng \
dev-util/pkgdiff \
dev-util/japi-compliance-checker \
"

RUN emerge-webrsync; \
    echo "app-text/ghostscript-gpl cups" \
    >> /etc/portage/package.use/0-docker-build; \
    emerge --color y --verbose --quiet-build --oneshot ${ATOMS}; \
    eselect java-vm set system openjdk-bin-11; \
    rm -r /var/cache/distfiles /var/db/repos/gentoo
