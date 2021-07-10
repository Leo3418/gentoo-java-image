FROM gentoo/stage3:latest

RUN emerge-webrsync; \
    env USE="headless-awt -png" emerge --color y --verbose --oneshot \
    dev-java/openjdk-bin:8 \
    dev-java/junit:4 \
    dev-java/testng \
    dev-util/pkgdiff \
    dev-util/japi-compliance-checker \
    ; \
    rm -r /var/db/repos/gentoo
