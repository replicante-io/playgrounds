FROM fedora:28
ARG NATS_VERSION


# Install needed packages
RUN dnf install -y git wget \
    && dnf clean all


# Install NATS Streaming
ENV PATH=$PATH:/usr/local/go/bin
RUN wget -O /tmp/golang.tar.gz https://dl.google.com/go/go1.10.3.linux-amd64.tar.gz \
    && tar -C /usr/local --extract --file /tmp/golang.tar.gz \
    && go get -d -t -v github.com/nats-io/nats-streaming-server \
    && cd /root/go/src/github.com/nats-io/nats-streaming-server \
    && git checkout v${NATS_VERSION} \
    && go build
