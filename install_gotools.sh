#!/usr/bin/env bash

TMP_DIR="/tmp"
GO_SRC_DIR="$GOPATH/src"
echo $GO_SRC_DIR

cd $TMP_DIR
git clone https://github.com/golang/tools.git

cd $GO_SRC_DIR
mkdir -p golang.org/x/tools && rm -rf golang.org/x/tools/
mv $TMP_DIR/tools golang.org/x/

go get golang.org/x/tools/cmd/goimports
go get golang.org/x/tools/cmd/guru
go get golang.org/x/tools/cmd/gorename

