FROM gentoo/stage3:latest

ARG ATOMS="\
dev-java/openjdk:8 \
dev-java/junit:4 \
dev-java/testng \
dev-util/pkgdiff \
dev-util/japi-compliance-checker \
"

RUN emerge-webrsync; \
    echo "app-text/ghostscript-gpl cups" \
    >> /etc/portage/package.use/0-docker-build; \
    emerge --color y --verbose --quiet-build --oneshot ${ATOMS}; \
    emerge --color y --depclean dev-java/openjdk-bin:8; \
    eselect java-vm set system openjdk-8; \
    rm -r /var/cache/distfiles /var/db/repos/gentoo
