FROM mgoltzsche/podman

RUN apk update && apk add --no-cache curl wget unzip gcompat zip &&  \
    curl -s https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip && \
    unzip awscliv2.zip && ./aws/install
