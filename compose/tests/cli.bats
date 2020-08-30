#!/usr/bin/env bats

load test_helpers/common.bash
load test_helpers/running_docker.bash

@test 'failing command' {
  cd "$(magento_docker_base_path)"
  run bin/cli ls dummydir
  [ "$status" -ne 0 ]
  [[ "$output" =~ "ls: cannot access 'dummydir': No such file or director" ]]
}
