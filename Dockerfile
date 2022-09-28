FROM mgoltzsche/podman

RUN apk add --no-cache wget unzip curl bash

RUN wget "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -O "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf awscliv2.zip \
    && rm -rf ./aws
