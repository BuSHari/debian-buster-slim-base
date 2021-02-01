ARG FRM='debian:buster-slim'

FROM ${FRM}
ARG FRM

# Install basic packages
RUN apt-get -y update \
    && apt-get -y dist-upgrade \
    && apt-get -y install sudo bash nano procps tini \
    && apt-get -y autoremove \
    && apt-get -y autoclean \
    && apt-get -y clean \
    && rm -fr /tmp/* /var/tmp/* /var/lib/apt/lists/*

RUN echo "$(date "+%d.%m.%Y %T") Built from ${FRM}" >> /build_date
