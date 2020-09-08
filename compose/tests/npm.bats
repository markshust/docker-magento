#!/usr/bin/env bats

load test_helpers/common.bash
load test_helpers/running_docker.bash

@test 'npm: show help' {
  run "$(magento_docker_base_path)"/bin/npm -h
  echo "$output"
  [ "$status" -eq 1 ]
  regex="Usage: npm <command>"
  [[ "${lines[1]}" =~ $regex ]]
}
