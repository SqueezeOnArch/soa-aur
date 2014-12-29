#!/bin/bash

opt="-f"

if [ "$1" == "-f" ]; then
	opt="-d -f -f"
fi

echo Clean started: `date`
echo

pushd `dirname $0` > /dev/null

git clean $opt

popd > /dev/null

echo
echo Clean complete: `date`
