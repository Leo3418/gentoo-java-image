FROM gentoo/stage3:latest

RUN emerge-webrsync
RUN env USE="headless-awt" emerge --color y --verbose --oneshot \
    dev-java/openjdk-bin:8 \
    virtual/jdk:1.8 \
    virtual/jre:1.8
