FROM mgoltzsche/podman

RUN apt-get update -qq && apt install wget curl zip -y

RUN wget "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -O "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf awscliv2.zip \
    && rm -rf ./aws
