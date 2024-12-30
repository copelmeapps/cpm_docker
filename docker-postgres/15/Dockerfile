# Copyright Broadcom, Inc. All Rights Reserved.
# SPDX-License-Identifier: APACHE-2.0
ARG POSTGRES_VERSION_SHORT=15
ARG POSTGRES_VERSION=15.7.0

FROM docker.io/bitnami/postgresql:${POSTGRES_VERSION_SHORT}

ARG TARGETARCH
ARG WITH_ALL_LOCALES="no"

LABEL org.opencontainers.image.base.name="docker.io/bitnami/postgresql:15" \
      org.opencontainers.image.created="2024-12-29T12:51:43Z" \
      org.opencontainers.image.description="Application packaged by Copelme S.A." \
      org.opencontainers.image.licenses="Apache-2.0" \
      org.opencontainers.image.title="odoo copelme" \
      org.opencontainers.image.vendor="Copelme S.A." \
      org.opencontainers.image.version="15.0.20241229"

USER postgres

COPY --chmod=0755 ./resources/scripts/libvalidations.sh /opt/bitnami/scripts/libvalidations.sh
COPY --chmod=0755 ./resources/scripts/postgresql-env.sh /opt/bitnami/scripts/postgresql-env.sh
COPY --chmod=0755 ./resources/scripts/libpostgresql.sh /opt/bitnami/scripts/libpostgresql.sh
      
USER 1001
