#!/bin/bash

AUTHOR=$1

commits=$(git log --pretty=oneline --author=$AUTHOR | cut -f1 -d' ')
echo $commits

dst=$(pwd)/${AUTHOR}_patches
mkdir $dst

for ct in $commits; do
    patch=$(git format-patch -1 $ct)
    mv $patch $dst/
done
