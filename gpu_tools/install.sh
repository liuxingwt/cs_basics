#!/bin/bash

set -e

apt-get update -y && \
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
         apt-transport-https \
         ca-certificates \
         gnupg \
         wget

echo "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 /" >> /etc/apt/sources.list && \
wget -qO - https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub | apt-key add - && \
wget -qO - https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub | apt-key add - && \
wget -qO - https://developer.download.nvidia.cn/compute/cuda/repos/ubuntu2004/x86_64/3bf863cc.pub | apt-key add - && \
apt-get update && \
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends nsight-systems-2021.5.2
