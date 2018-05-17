FROM node:9.11

ENV REPLI_BACKEND_ROOT=http://replicante:16016
RUN groupadd -r replicante \
  && useradd -r -g replicante replicante \
  && mkdir -p /replicante/webui /home/replicante \
  && chown -R replicante:replicante /replicante /home/replicante

USER replicante
WORKDIR /replicante/webui
RUN git clone --recursive https://github.com/replicante-io/webui.git . \
  && npm install \
  && npm run build

EXPOSE 3000
