FROM gentoo/stage3:latest

ARG ATOMS="\
dev-java/openjdk-bin:8 \
dev-java/junit:4 \
dev-java/testng \
dev-util/pkgdiff \
dev-util/japi-compliance-checker \
"

RUN emerge-webrsync; \
    emerge --color y --verbose --quiet-build --oneshot ${ATOMS}; \
    rm -r /var/db/repos/gentoo
