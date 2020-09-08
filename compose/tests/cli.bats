#!/usr/bin/env bats

load test_helpers/common.bash
load test_helpers/running_docker.bash

@test 'failing command' {
  run "$(magento_docker_base_path)"/bin/cli ls dummydir
  echo "$output"
  [ "$status" -ne 0 ]
  [[ "$output" =~ "ls: cannot access 'dummydir': No such file or director" ]]
}
