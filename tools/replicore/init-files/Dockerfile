FROM debian:stretch-slim

# Install dependency clients.
RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && apt-get install -y mongodb-clients \
    && apt-get clean all

# Copy init files into the image.
COPY . /files
CMD ["bash", "/files/init.sh"]
