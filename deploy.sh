#!/bin/bash


go get github.com/mitchellh/gox
go get github.com/tcnksm/ghr
  
cd ./cmd/server/
gox -output "../../dist/{{.OS}}_{{.Arch}}_{{.Dir}}"

cd ../../cmd/client
gox -output "../../dist/{{.OS}}_{{.Arch}}_{{.Dir}}"

cd ../../cmd/control
gox -output "../../dist/{{.OS}}_{{.Arch}}_{{.Dir}}"

cd ../../
ghr $TRAVIS_TAG --username lovedboy --token $GITHUB_TOKEN  --replace  --debug  dist/
