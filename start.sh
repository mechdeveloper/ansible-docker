#!/usr/bin/env bash
# docker run --rm -it \
docker run -it \
  -v ~/.ssh/id_rsa:/root/.ssh/id_rsa \
  -v ~/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub \
  -v $(pwd):/ansible/playbooks \
  -v /var/log/ansible/ansible.log \
  my-ansible:ubuntu-18.04 "$@"