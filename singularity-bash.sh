#!/bin/bash
sudo apt-get update && sudo apt-get install -y \
    build-essential \
    libssl-dev \
    uuid-dev \
    libgpgme11-dev \
    squashfs-tools \
    libseccomp-dev \
    pkg-config
export VERSION=1.11 OS=linux ARCH=amd64 && \
    wget https://dl.google.com/go/go$VERSION.$OS-$ARCH.tar.gz && \
    sudo tar -C /usr/local -xzvf go$VERSION.$OS-$ARCH.tar.gz && \
    rm go$VERSION.$OS-$ARCH.tar.gz
echo 'export GOPATH=${HOME}/go' >> ~/.bashrc && \
    echo 'export PATH=/usr/local/go/bin:${PATH}:${GOPATH}/bin' >> ~/.bashrc && \
    source ~/.bashrc
go get -u github.com/golang/dep/cmd/dep
go get -d github.com/sylabs/singularity
export VERSION=v3.0.3 && \
    cd $GOPATH/src/github.com/sylabs/singularity && \
    git fetch && \
    git checkout $VERSION
sudo apt-get install -y numactl
sudo apt-get install -y git
sudo apt-get install time 
sudo git clone https://github.com/thewmf/kvm-docker-comparison.git
sudo ./kvm-docker-comparison/Stream/linux.sh 1
sudo ./kvm-docker-comparison/linpack/linux.sh 1
