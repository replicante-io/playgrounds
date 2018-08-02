FROM fedora:28
ARG STOLON_VERSION


# Install needed packages
RUN dnf install -y git wget \
    && dnf clean all


# Install stolon
ENV PATH=$PATH:/usr/local/go/bin
RUN wget -O /tmp/golang.tar.gz https://dl.google.com/go/go1.10.3.linux-amd64.tar.gz \
    && tar -C /usr/local --extract --file /tmp/golang.tar.gz \
    && mkdir -p /opt/stolon \
    && cd /opt/stolon \
    && git clone https://github.com/sorintlab/stolon.git . \
    && git checkout v${STOLON_VERSION} \
    && ./build
