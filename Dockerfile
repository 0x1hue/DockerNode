# Slimified versions and alpine don't include ca-certificates for apt
FROM node:24-bookworm

RUN for file in /etc/apt/sources.list.d/*; do \
      sed -i 's/http:/https:/g' "$file"; \
    done

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

SHELL ["/bin/bash", "-c"]

# Update in the prod version of Dockerfile
ENV NODE_ENV=development
WORKDIR /app

