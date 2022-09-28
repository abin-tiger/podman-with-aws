FROM mgoltzsche/podman

ENV AWS_CLI_VER=2.0.30


RUN apk update && apk add --no-cache curl wget unzip gcompat zip &&  \
    curl -s https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${AWS_CLI_VER}.zip -o awscliv2.zip && \
    unzip awscliv2.zip && ./aws/install
