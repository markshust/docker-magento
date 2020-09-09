#!/usr/bin/env bats

load test_helpers/common.bash
load test_helpers/running_docker.bash

@test 'cli: bash is preset' {
  run "$(magento_docker_base_path)"/bin/cli bash -c "echo 'hello world'"
  [ "$status" -eq 0 ]
  [[ "$output" =~ "hello world" ]]
}
