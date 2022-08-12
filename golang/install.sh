#!/bin/bash

# apt install build-essential
# https://go.dev/doc/install
# https://go.dev/doc/gopath_code#GOPATH

#GOLANG_VERSION=1.17.11
#GOLANG_ARCH=amd64

GOLANG_VERSION=
GOLANG_ARCH=
curl -sLf https://golang.org/dl/go${GOLANG_VERSION}.linux-${GOLANG_ARCH}.tar.gz | tar xvzf - -C /usr/local

mkdir -p /opt/go
cat << EOF > /etc/profile.d/golang.sh
export GOPATH=/opt/go
export PATH=$PATH:/usr/local/go/bin:/opt/go/bin
EOF
chmod +x /etc/profile.d/golang.sh
source /etc/profile.d/golang.sh
