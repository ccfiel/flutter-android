FROM runmymind/docker-android-sdk:alpine-standalone

ENV FLUTTER_VERSION: "https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_1.22.2-stable.tar.xz"

RUN apk update
RUN apk upgrade
RUN apk add wget tar unzip bash
RUN apk add --update --no-cache lcov

RUN wget --quiet --output-document=flutter.tar.xz ${FLUTTER_VERSION} \
    && tar xf flutter.tar.xz -C / \
    && rm flutter.tar.xz

ENV PATH=$PATH:/flutter/bin
RUN flutter doctor
