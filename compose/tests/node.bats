#!/usr/bin/env bats

load test_helpers/common.bash
load test_helpers/running_docker.bash

@test 'node: show help' {
  run "$(magento_docker_base_path)"/bin/node -h
  [ "$status" -eq 0 ]
  regexp="Usage: node" 
  [[ "${lines[0]}" =~ $regexp ]]
}
