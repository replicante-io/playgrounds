FROM fedora:28

ARG PG_PATCH
ARG PG_VERSION
ARG PG_VERSION_STR
ARG STOLON_VERSION

ENV PATH=$PATH:/usr/local/go/bin:/usr/pgsql-${PG_VERSION}/bin


# Install needed packages
RUN dnf install -y git wget \
    && dnf clean all


# Install postgresql
RUN dnf install -y https://download.postgresql.org/pub/repos/yum/${PG_VERSION}/fedora/fedora-28-x86_64/pgdg-fedora${PG_VERSION_STR}-${PG_VERSION}-${PG_PATCH}.noarch.rpm \
    && dnf install -y postgresql${PG_VERSION_STR} postgresql${PG_VERSION_STR}-server \
    && dnf clean all \
    && mkdir /data \
    && chown postgres:postgres /data
VOLUME ["/data"]


# Install stolon
RUN wget -O /tmp/golang.tar.gz https://dl.google.com/go/go1.10.3.linux-amd64.tar.gz \
    && tar -C /usr/local --extract --file /tmp/golang.tar.gz \
    && mkdir -p /opt/stolon \
    && cd /opt/stolon \
    && git clone https://github.com/sorintlab/stolon.git . \
    && git checkout v${STOLON_VERSION} \
    && ./build

USER postgres
