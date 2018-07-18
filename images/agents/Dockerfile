FROM rust:1.24

RUN export DEBIAN_FRONTEND=noninteractive \
  && apt-get update \
  && apt-get install -y cmake \
  && rm -rf /var/lib/apt/lists/* \
  && groupadd -r replicante \
  && useradd -r -g replicante replicante \
  && mkdir -p /replicante/agents \
  && chown -R replicante:replicante /replicante

USER replicante
WORKDIR /replicante/agents
RUN git clone --recursive https://github.com/replicante-io/agents.git . \
  && cargo build

EXPOSE 37017
