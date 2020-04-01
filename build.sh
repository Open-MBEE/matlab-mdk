#!/bin/bash

VERSION=3.4.2

rm -r build/
mkdir -p build/
cp -r examples build/

echo "Installing with mms-matlab-client:${VERSION}"
echo "Downloading from https://dl.bintray.com/openmbee/maven/gov/nasa/jpl/mms/mms-matlab-client/${VERSION}/mms-matlab-client-${VERSION}.zip"
curl -sL "https://dl.bintray.com/openmbee/maven/gov/nasa/jpl/mms/mms-matlab-client/${VERSION}/mms-matlab-client-${VERSION}.zip" -o mms-matlab-client.zip
unzip -q mms-matlab-client.zip -d build/
rm mms-matlab-client.zip

echo "Run MATLAB Toolbox Packager on $(pwd)/build/"