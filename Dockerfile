FROM quay.io/containers/podman

RUN ln -s /usr/local/bin/podman /usr/bin/docker

RUN yum install wget unzip curl zip -y &&  \
    curl -s https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip && \
    unzip awscliv2.zip && ./aws/install
