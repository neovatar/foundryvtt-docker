ARG FVTT_VERSION=9.266
ARG FVTT_INSTALL_DIR=/var/foundryvtt/foundryvtt-${FVTT_VERSION}
ARG FVTT_DATA_DIR=/var/foundryvtt/data
ARG FVTT_UID
ARG FVTT_GUID

FROM node:14-slim as unzip
ARG FVTT_VERSION
ARG FVTT_INSTALL_DIR
ARG FVTT_ZIP=FoundryVTT-${FVTT_VERSION}.zip

COPY download/${FVTT_ZIP} /tmp/${FVTT_ZIP}

RUN apt-get update \
 && apt-get install unzip \
 && rm -rf /var/lib/apt

RUN mkdir -p ${FVTT_INSTALL_DIR} \
 && unzip /tmp/${FVTT_ZIP} -d ${FVTT_INSTALL_DIR}

FROM node:14-slim
ARG FVTT_VERSION
ARG FVTT_INSTALL_DIR
ARG FVTT_DATA_DIR
ARG FVTT_UID
ARG FVTT_GUID

LABEL fvtt_version=${FVTT_VERSION}
ENV FVTT_INSTALL_DIR=${FVTT_INSTALL_DIR}
ENV FOUNDRY_VTT_DATA_PATH=${FVTT_DATA_DIR}

COPY --from=unzip ${FVTT_INSTALL_DIR} ${FVTT_INSTALL_DIR}

RUN deluser node \
 && addgroup --gid ${FVTT_GUID} foundry \
 && adduser --gecos "" --disabled-password --gid ${FVTT_GUID} --uid ${FVTT_UID} --no-create-home --home /var/empty foundry \
 && mkdir -p ${FVTT_DATA_DIR} \
 && chown foundry:foundry ${FVTT_DATA_DIR}

WORKDIR ${FVTT_INSTALL_DIR}

USER foundry

EXPOSE 30000

CMD  ["node", "./resources/app/main.js"]
