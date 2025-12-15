#!/bin/bash
set -e

apt update -y
apt install -y curl docker.io

systemctl enable docker
systemctl start docker

curl -sfL https://get.k3s.io | sh -

chmod 644 /etc/rancher/k3s/k3s.yaml
