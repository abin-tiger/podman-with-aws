FROM quay.io/containers/podman:v4.2.0
## The base image is based on fedora. Package managers available are yum and def.

RUN ln -s /usr/bin/podman /usr/bin/docker

RUN yum install wget unzip curl zip python3 -y &&  \
    curl -s https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip && \
    unzip awscliv2.zip && ./aws/install

ADD https://dl.k8s.io/release/v1.21.0/bin/linux/amd64/kubectl /usr/local/bin/
RUN chmod +x /usr/local/bin/kubectl
ADD https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/aws-iam-authenticator /usr/local/bin/
RUN chmod +x /usr/local/bin/aws-iam-authenticator

RUN wget https://get.helm.sh/helm-v3.11.1-linux-amd64.tar.gz \
    && tar -zxvf helm-v3.11.1-linux-amd64.tar.gz \
    && mv linux-amd64/helm /usr/local/bin/ \
    && chmod +x /usr/local/bin/helm \
    && rm -rf helm-v3.11.1-linux-amd64.tar.gz linux-amd64

RUN python3 -m pip install --no-cache-dir kubernetes boto3 pandas requests s3fs retry
