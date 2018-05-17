FROM rust:1.24

RUN export DEBIAN_FRONTEND=noninteractive \
  && apt-get update \
  && apt-get install -y \
    cmake \
    mongodb-clients \
  && rm -rf /var/lib/apt/lists/* \
  && groupadd -r replicante \
  && useradd -r -g replicante replicante \
  && mkdir -p /replicante/core \
  && chown -R replicante:replicante /replicante

USER replicante
WORKDIR /replicante/core
RUN git clone --recursive https://github.com/replicante-io/replicante.git . \
  && cargo build

COPY indexes.js init.js init.sh /files/

EXPOSE 16016
