FROM gentoo/stage3:latest

ARG ATOMS="\
dev-java/openjdk-bin:8 \
dev-java/junit:4 \
dev-java/testng \
dev-util/pkgdiff \
dev-util/japi-compliance-checker \
"

RUN emerge-webrsync; \
    env USE="headless-awt -png" \
    emerge --color y --verbose --quiet-build y --oneshot ${ATOMS}; \
    rm -r /var/db/repos/gentoo
