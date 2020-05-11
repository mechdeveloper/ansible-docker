FROM ubuntu:18.04

LABEL maintainer="mechashishsingh@gmail.com"

RUN \
    echo "==>Installing Ansible on Ubuntu"  && \
    apt-get update && \
    apt-get install python3-pip -y && \
    pip3 install awscli && \
    pip3 install ansible && \
    pip3 install boto boto3

WORKDIR /ansible/playbooks

ENTRYPOINT ["/bin/bash"]