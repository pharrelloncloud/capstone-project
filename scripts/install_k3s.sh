#!/bin/bash
set -e

if ! command -v k3s >/dev/null 2>&1; then
  curl -sfL https://get.k3s.io | sh -
fi

sudo chmod 644 /etc/rancher/k3s/k3s.yaml

