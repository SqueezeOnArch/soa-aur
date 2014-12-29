#!/bin/bash

echo Clean started: `date`
echo

pushd `dirname $0` > /dev/null

git clean -f $1

popd > /dev/null

echo
echo Clean complete: `date`
